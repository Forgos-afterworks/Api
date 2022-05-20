<?php

namespace App\Controller;

use App\Entity\Employe;
use App\Repository\EmployeRepository;
use App\Repository\RoleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class EmployeController extends AbstractController {

    private EmployeRepository $employeRepository;
    private SerializerInterface $serializer;
    private EntityManagerInterface $entityManager;
    private ValidatorInterface $validator;
    private RoleRepository $roleRepository;

    public function __construct(EmployeRepository      $employeRepository, SerializerInterface $serializer,
                                EntityManagerInterface $entityManager, ValidatorInterface $validator,
                                RoleRepository         $roleRepository) {
        $this->employeRepository = $employeRepository;
        $this->serializer = $serializer;
        $this->entityManager = $entityManager;
        $this->validator = $validator;
        $this->roleRepository = $roleRepository;
    }

    /**
     * @Route("/api/employes", name="get_article_getAllEmployes", methods={"GET"})
     */
    public function getAllEmployes(): Response {
        $articlesJson = $this->serializer->serialize($this->employeRepository->findAll(), "json", ["groups" => "employe_read"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/employes/{idEmploye}", name="get_article_getEmployeById", methods={"GET"})
     */
    public function getEmployeById(int $idEmploye): Response {
        $articlesJson = $this->serializer->serialize($this->employeRepository->find(["idEmploye" => $idEmploye]), "json", ["groups" => "employe_read"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/employes/{idEmploye}", name="api_employes_updateEmploye", methods={"PUT"})
     * @return Response
     */
    public function updateEmploye(Request $request, $idEmploye): Response {
        $requestJson = json_decode($request->getContent(), true);
        $employe = $this->employeRepository->find($idEmploye);
        $employe->setEmail($requestJson["email"]);
        $employe->setNom($requestJson["nom"]);
        $employe->setPrenom($requestJson["prenom"]);
        $employe->setLibAdresse($requestJson["libAdresse"]);
        $employe->setVilleAdresse($requestJson["villeAdresse"]);
        $employe->setCpAdresse($requestJson["cpAdresse"]);


        $role = $this->roleRepository->find($requestJson["idRole"]);
        $employe->setIdRole($role);

        $responseValidate = $this->validatorErrors($employe);
        if (!is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        return new JsonResponse($this->serializer->serialize($employe, "json"), Response::HTTP_OK, [], true);

    }

    /**
     * @Route("/api/employes", name="api_employe_createEmploye", methods={"POST"})
     */
    public function createEmploye(Request $request): Response {
        $bodyContent = $request->getContent();
        try {
            $employe = $this->serializer->deserialize($bodyContent, Employe::class, "json");

            $errors = $this->validatorErrors($employe);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($employe);
            $this->entityManager->flush();

            $employeJson = $this->serializer->serialize($employe, "json");
            return new JsonResponse($employeJson, Response::HTTP_CREATED, [], true);
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

    private function validatorErrors(Employe $employe): ?Response {
        $errors = $this->validator->validate($employe);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
