<?php

namespace App\Controller;

use App\Entity\Declinaison;
use App\Repository\DeclinaisonRepository;
use App\Repository\ProduitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;

class DeclinaisonController extends AbstractController {
    private DeclinaisonRepository $declinaisonRepository;
    private SerializerInterface $serializer;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;
    private ProduitRepository $produitRepository;

    public function __construct(ValidatorInterface  $validator, DeclinaisonRepository $declinaisonRepository,
                                SerializerInterface $serializer, EntityManagerInterface $entityManager,
                                ProduitRepository $produitRepository) {
        $this->serializer = $serializer;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->declinaisonRepository = $declinaisonRepository;
        $this->produitRepository = $produitRepository;
    }

    /**
     * @Route("/api/declinaisons", name="get_declinaison_getAllDeclinaisons", methods={"GET"})
     */
    public function getAllDeclinaisons(): Response {
        $declinaisonsJson = $this->serializer->serialize($this->declinaisonRepository->findAll(), "json", ["groups" => "declinaison_read"]);
        return new JsonResponse($declinaisonsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/declinaisons/{id}", name="api_declinaison_getDeclinaisonById", methods={"GET"})
     */
    public function getDeclinaisonById(int $id): Response {
        $declinaison = $this->declinaisonRepository->find($id);
        if (!$declinaison) {
            return $this->declinaisonDoesntExist();
        }
        $declinaisonsJson = $this->serializer->serialize($declinaison, "json", ["groups" => "declinaison_read"]);
        return new JsonResponse($declinaisonsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/declinaisons", name="api_declinaison_createDeclinaison", methods={"POST"})
     */
    public function createDeclinaison(Request $request): Response {
        $bodyContent = $request->getContent();
        $infos = json_decode($bodyContent, true);
        try {
            $declinaison = $this->serializer->deserialize($bodyContent, Declinaison::class, "json");

            foreach ($infos["produits"] as $produit) {
                $declinaison->addIdProduit(
                    $this->produitRepository->find($produit["idProduit"])
                );
            }

            $errors = $this->validatorErrors($declinaison);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($declinaison);
            $this->entityManager->flush();

            $declinaisonJson = $this->serializer->serialize($declinaison, "json", ["groups" => "declinaison_read"]);
            return new JsonResponse($declinaisonJson, Response::HTTP_CREATED, [], true);
        }
            //Je vais intercepter une éventuelle exception
        catch (\Exception $exception) {
            $error = [
                "status" => Response::HTTP_BAD_REQUEST,
                "message" => "Le JSON envoyé dans la requête n'est pas valide."
            ];
            return new JsonResponse(json_encode($error), $error["status"], [], true);
        }
    }

    /**
     * @Route("/api/declinaisons/{id}", name="api_declinaison_updateDeclinaison", methods={"PUT"})
     * @return Response
     */
    public function updateDeclinaison(Request $request, $id) : Response  {
        $bodyContent = $request->getContent();
        $declinaison = $this->declinaisonRepository->find($id);
        $this->serializer->deserialize($bodyContent,Declinaison::class,'json',
            ["object_to_populate" => $declinaison]);

        if (isset($infos["produits"])) {
            foreach ($infos["produits"] as $produit) {
                $declinaison->addIdProduit(
                    $this->produitRepository->find($produit["idProduit"])
                );
            }
        }

        $responseValidate = $this->validatorErrors($declinaison);
        if (! is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        $declinaisonJson = $this->serializer->serialize($declinaison, "json", ["groups" => "declinaison_read"]);
        return new JsonResponse($declinaisonJson, Response::HTTP_CREATED, [], true);
    }

    private function declinaisonDoesntExist(): Response {
        $error = [
            "status" => Response::HTTP_NOT_FOUND,
            "message" => "La déclinaison demandée n'existe pas."
        ];
        //Générer une réponse JSON
        return new JsonResponse(json_encode($error), $error["status"], [], true);
    }
    private function validatorErrors(Declinaison $declinaison): ?Response {
        $errors = $this->validator->validate($declinaison);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
