<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Repository\CategorieRepository;
use App\Repository\DeclinaisonRepository;
use App\Repository\ProduitRepository;
use App\Repository\TvaRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;

class ProduitController extends AbstractController {
    private  ProduitRepository  $produitRepository;
    private  SerializerInterface  $serializer;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;
    private CategorieRepository $categorieRepository;
    private TvaRepository $tvaRepository;
    private DeclinaisonRepository  $declinaisonRepository;

    public function __construct(ProduitRepository  $produitRepository, ValidatorInterface $validator,
                                SerializerInterface    $serializer, EntityManagerInterface $entityManager,
                                CategorieRepository $categorieRepository, TvaRepository $tvaRepository,
                                DeclinaisonRepository  $declinaisonRepository) {
        $this->produitRepository = $produitRepository;
        $this->serializer = $serializer;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->categorieRepository = $categorieRepository;
        $this->tvaRepository = $tvaRepository;
        $this->declinaisonRepository = $declinaisonRepository;
    }

    /**
     * @Route("/api/produits", name="get_produit_getAllProduits", methods={"GET"})
     */
    public function getAllProduits():Response {
       $produitsJson = $this->serializer->serialize($this->produitRepository->findAll(),
            "json", ["groups" => "produit_read"]);
        return new JsonResponse($produitsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/produits/categorie/{idCategorie}", name="get_produit_getProduitsByCaterory", methods={"GET"})
     */
    public function getProduitsByCaterory(int $idCategorie):Response {
        $produitsJson = $this->serializer->serialize($this->produitRepository->findBy(["idCategorie" => $idCategorie]),
            "json", ["groups" => "produit_read"]);
        return new JsonResponse($produitsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/produits/{id}", name="api_produit_getProduitById", methods={"GET"})
     */
    public function getProduitById(int $id): Response {
        $produit = $this->produitRepository->find($id);
        if (!$produit) {
            return $this->produitDoesntExist();
        }
        $produitsJson = $this->serializer->serialize($produit, "json", ["groups" => "produit_read"]);
        return new JsonResponse($produitsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/produits", name="api_produit_createProduit", methods={"POST"})
     */
    public function createProduit(Request $request): Response {
        $bodyContent = $request->getContent();
        $infos = json_decode($bodyContent, true);
        try {
            $produit = $this->serializer->deserialize($bodyContent, Produit::class, "json");

            $categorie = $this->categorieRepository->find($infos["idCategorie"]);
            $produit->setCategorie($categorie);

            $tva = $this->tvaRepository->find($infos["idTva"]);
            $produit->setTva($tva);

            foreach ($infos["declinaisons"] as $declinaison) {
                $produit->addIdDeclinaison(
                    $this->declinaisonRepository->find($declinaison["idDeclinaison"])
                );
            }

            $errors = $this->validatorErrors($produit);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($produit);
            $this->entityManager->flush();

            $produitJson = $this->serializer->serialize($produit, "json", ["groups" => "produit_read"]);
            return new JsonResponse($produitJson, Response::HTTP_CREATED, [], true);
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
     * @Route("/api/produits/{id}", name="api_produit_updateProduit", methods={"PUT"})
     * @return Response
     */
    public function updateProduit(Request $request, $id) : Response  {
        $bodyContent = $request->getContent();
        $produit = $this->produitRepository->find($id);
        $this->serializer->deserialize($bodyContent,Produit::class,'json',
            ["object_to_populate" => $produit]);

        $infos = json_decode($bodyContent, true);
        if (isset($infos["idCategorie"])) {
            $categorie = $this->categorieRepository->find($infos["idCategorie"]);
            $produit->setCategorie($categorie);
        }

        if (isset($infos["idTva"])) {
            $tva = $this->tvaRepository->find($infos["idTva"]);
            $produit->setTva($tva);
        }

        if (isset($infos["declinaisons"])) {
            foreach ($infos["declinaisons"] as $declinaison) {
                $produit->addIdDeclinaison(
                    $this->declinaisonRepository->find($declinaison["idDeclinaison"])
                );
            }
        }

        $responseValidate = $this->validatorErrors($produit);
        if (! is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        $produitJson = $this->serializer->serialize($produit, "json", ["groups" => "produit_read"]);
        return new JsonResponse($produitJson, Response::HTTP_CREATED, [], true);
    }

    /**
     * @Route("/api/produits/{id}", name="api_produits_deleteProduit", methods={"DELETE"})
     * @return Response
     */
    public function deleteProduit($id) : Response {
        try {
            // Recherche du post dont l'id est $id
            $produit = $this->produitRepository->find($id);
            // Suppression dans la base de données
            $this->entityManager->remove($produit);
            $this->entityManager->flush();
            // Renvoyer une réponse HTTP
            return new JsonResponse(null,Response::HTTP_NO_CONTENT);
        } catch (\Exception $e) {
            $error = [
                "status" => Response::HTTP_NOT_FOUND,
                "message" => "La ressource demandée n'est pas accessible."
            ];
            return new JsonResponse(json_encode($error), $error["status"], [], true);
        }
    }

    private function produitDoesntExist(): Response {
        $error = [
            "status" => Response::HTTP_NOT_FOUND,
            "message" => "Le produit demandée n'existe pas."
        ];
        //Générer une réponse JSON
        return new JsonResponse(json_encode($error), $error["status"], [], true);
    }

    private function validatorErrors(Produit $produit): ?Response {
        $errors = $this->validator->validate($produit);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
