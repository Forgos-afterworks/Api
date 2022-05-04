<?php

namespace App\Controller;

use App\Entity\Rubrique;
use App\Repository\RubriqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class RubriqueController extends AbstractController {

    private RubriqueRepository $rubriqueRepository;
    private SerializerInterface $serializer;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;

    public function __construct(RubriqueRepository $rubriqueRepository, SerializerInterface $serializer, ValidatorInterface $validator,
                                EntityManagerInterface $entityManager) {
        $this->rubriqueRepository = $rubriqueRepository;
        $this->serializer = $serializer;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/api/rubriques", name="api_produit_getAllRubriques", methods={"GET"})
     */
    public function getAllRubriques(): Response {
        $rubriquesJson = $this->serializer->serialize($this->rubriqueRepository->findAll(), "json");
        return new JsonResponse($rubriquesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/rubriques/{idRubrique}", name="api_produit_getProduitById", methods={"GET"})
     */
    public function getRubriqueById(int $idRubrique): Response {
        $rubriqueJson = $this->serializer->serialize($this->rubriqueRepository->find(["idRubrique" => $idRubrique]), "json");
        return new JsonResponse($rubriqueJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/rubriques", name="api_produit_createRubrique", methods={"POST"})
     */
    public function createRubrique(Request$request): Response {
        $bodyContent = $request->getContent();
        try {
            $rubrique = $this->serializer->deserialize($bodyContent, Rubrique::class, "json");

            $errors = $this->validatorErrors($rubrique);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($rubrique);
            $this->entityManager->flush();

            $rubriqueJson = $this->serializer->serialize($rubrique, "json");
            return new JsonResponse($rubriqueJson, Response::HTTP_CREATED, [], true);
        }
            //Je vais intercepter une éventuelle exception
        catch (\Exception $exception) {
            $error = [
                "status" => Response::HTTP_BAD_REQUEST,
                "message" => "Le JSON envoyer dans la requete n'est pas valide."
            ];
            return new JsonResponse(json_encode($error), $error["status"], [], true);
        }
    }

    /**
     * @Route("/api/rubriques/{idRubrique}", name="api_rubriques_updateRubrique", methods={"PUT"})
     * @return Response
     */
    public function updateRubrique(Request $request, $idRubrique) : Response  {
        $requestJson = $request->getContent();
        $rubric = $this->rubriqueRepository->find($idRubrique);
        $this->serializer->deserialize($requestJson,Rubrique::class,'json',
            ["object_to_populate" => $rubric]);

        $responseValidate = $this->validatorErrors($rubric);
        if (! is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        return new Response("", Response::HTTP_NO_CONTENT);
    }

    private function validatorErrors(Rubrique $rubrique): ?Response {
        $errors = $this->validator->validate($rubrique);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
