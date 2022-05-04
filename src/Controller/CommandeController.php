<?php

namespace App\Controller;

use App\Entity\CommandeDeclinaison;
use App\Repository\CommandeDeclinaisonRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CommandeController extends AbstractController {

    private SerializerInterface $serializer;
    private CommandeDeclinaisonRepository $commandeDeclinaisonRepository;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;

    public function __construct(SerializerInterface $serializer, CommandeDeclinaisonRepository $commandeDeclinaisonRepository,
                                ValidatorInterface $validator, EntityManagerInterface $entityManager) {
        $this->serializer = $serializer;
        $this->commandeDeclinaisonRepository = $commandeDeclinaisonRepository;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/api/commandes", name="get_commande_getCommandes", methods={"GET"})
     */
    public function getCommandes(): Response {
        $articlesJson = $this->serializer->serialize($this->commandeDeclinaisonRepository->findAll(), "json", ["groups" => "commande_groups"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/commandes/{id}", name="get_commande_updateCommande", methods={"PUT"})
     */
    public function updateCommande($id, Request $request): Response {
        $commandeJson = $request->getContent();
        $commande = $this->commandeDeclinaisonRepository->find($id);
        $this->serializer->deserialize($commandeJson,CommandeDeclinaison::class,'json',
            ["object_to_populate" => $commande]);

        $responseValidate = $this->validatorErrors($commande);
        if (! is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        return new Response("", Response::HTTP_NO_CONTENT);
    }

    private function validatorErrors(CommandeDeclinaison $commandeDeclinaison): ?Response {
        $errors = $this->validator->validate($commandeDeclinaison);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
