<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Repository\CategorieRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CategorieController extends AbstractController {
    private  CategorieRepository  $categorieRepository;
    private  SerializerInterface  $serializer;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;

    public function __construct(CategorieRepository $categorieRepository, ValidatorInterface $validator,
                                SerializerInterface    $serializer, EntityManagerInterface $entityManager) {
        $this->categorieRepository = $categorieRepository;
        $this->serializer = $serializer;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/api/categories", name="get_categorie_getAllCategories", methods={"GET"})
     */
    public function getAllCategories():Response {
        $categoriesJson = $this->serializer->serialize($this->categorieRepository->findAll(), "json", ["groups" => "categorie_read"]);
        return new JsonResponse($categoriesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/categories/withProduct", name="get_categorie_getCategoriesWithProduct", methods={"GET"})
     */
    public function getCategoriesWithProduct():Response {
        $categoriesJson = $this->serializer->serialize($this->categorieRepository->getCategorieWithProduct(), "json", ["groups" => "categorie_read"]);
        return new JsonResponse($categoriesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/categories/{idCategorie}", name="api_categorie_getCategorieById", methods={"GET"})
     */
    public function getCategorieById(int $idCategorie): Response {
        $categorie = $this->categorieRepository->find($idCategorie);
        if (!$categorie) {
            return $this->categorieDoesntExist();
        }
        $categorieJson = $this->serializer->serialize($categorie, "json", ["groups" => "categorie_read"]);
        return new JsonResponse($categorieJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/categories", name="api_categorie_createCategorie", methods={"POST"})
     */
    public function createCategorie(Request $request): Response {
        $bodyContent = $request->getContent();
        try {
            $categorie = $this->serializer->deserialize($bodyContent, Categorie::class, "json");

            $errors = $this->validatorErrors($categorie);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($categorie);
            $this->entityManager->flush();

            $categorieJson = $this->serializer->serialize($categorie, "json");
            return new JsonResponse($categorieJson, Response::HTTP_CREATED, [], true);
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
     * @Route("/api/categories/{id}", name="api_categories_updateCategorie", methods={"PUT"})
     * @return Response
     */
    public function updateCategorie(Request $request, $id) : Response  {
        $postJson = $request->getContent();
        $categorie = $this->categorieRepository->find($id);
        $this->serializer->deserialize($postJson,Categorie::class,'json',
            ["object_to_populate" => $categorie]);

        $responseValidate = $this->validatorErrors($categorie);
        if (! is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        return new Response("", Response::HTTP_NO_CONTENT);
    }

    /**
     * @Route("/api/categories/{id}", name="api_categories_deleteCategorie", methods={"DELETE"})
     * @return Response
     */
    public function deleteCategorie($id) : Response {
        try {
            // Recherche du post dont l'id est $id
            $categorie = $this->categorieRepository->find($id);
            // Suppression dans la base de données
            $this->entityManager->remove($categorie);
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

    private function categorieDoesntExist(): Response {
        $error = [
            "status" => Response::HTTP_NOT_FOUND,
            "message" => "La catégorie demandée n'existe pas."
        ];
        //Générer une réponse JSON
        return new JsonResponse(json_encode($error), $error["status"], [], true);
    }

    private function validatorErrors(Categorie $categorie): ?Response {
        $errors = $this->validator->validate($categorie);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}