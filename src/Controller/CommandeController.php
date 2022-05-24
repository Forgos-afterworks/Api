<?php

namespace App\Controller;

use App\Entity\Commande;
use App\Repository\CommandeDeclinaisonRepository;
use App\Repository\CommandeRepository;
use App\Repository\StatutRepository;
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
    private CommandeRepository $commandeRepository;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;
    private StatutRepository $statutRepository;
    private CommandeDeclinaisonRepository $commandeDeclinaisonRepository;

    public function __construct(SerializerInterface $serializer, CommandeRepository $commandeRepository,
                                ValidatorInterface  $validator, EntityManagerInterface $entityManager,
                                StatutRepository    $statutRepository, CommandeDeclinaisonRepository $commandeDeclinaisonRepository) {
        $this->serializer = $serializer;
        $this->commandeRepository = $commandeRepository;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->statutRepository = $statutRepository;
        $this->commandeDeclinaisonRepository = $commandeDeclinaisonRepository;
    }

    /**
     * @Route("/api/commandedeclinaisons/{idCommand}", name="get_commande_getCommandeDeclinaisonByCommand", methods={"GET"})
     */
    public function getCommandeDeclinaisonByCommand($idCommand): Response {
        $articlesJson = $this->serializer->serialize($this->commandeDeclinaisonRepository->findBy(["idCommande" => $idCommand]),
            "json",  ["groups" => "commandeDeclinaison_groups"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/commandes", name="get_commande_getCommandes", methods={"GET"})
     */
    public function getCommandes(): Response {
        $articlesJson = $this->serializer->serialize($this->commandeRepository->findAll(),
            "json", ["groups" => "commande_groups"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/commandes/{idCommand}", name="get_commande_getCommandByIdCommand", methods={"GET"})
     */
    public function getCommandByIdCommand($idCommand): Response {
        $articlesJson = $this->serializer->serialize($this->commandeRepository->findBy(["idCommande" =>$idCommand]),
            "json", ["groups" => "commande_groups"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/commandes/{id}", name="get_commande_updateCommande", methods={"PUT"})
     */
    public function updateCommande($id, Request $request): Response {
        $bodyContent = $request->getContent();
        $commande = $this->commandeRepository->find($id);
        $this->serializer->deserialize($bodyContent, Commande::class, 'json',
            ["object_to_populate" => $commande]);

        $infos = json_decode($bodyContent, true);
        if (isset($infos["idStatut"])) {
            $statut = $this->statutRepository->find($infos["idStatut"]);
            $commande->setIdStatut($statut);
        }

        $responseValidate = $this->validatorErrors($commande);
        if (!is_null($responseValidate)) {
            return $responseValidate;
        }
        $this->entityManager->flush();
        return new Response("", Response::HTTP_NO_CONTENT);
    }

    /**
     * @Route("/api/statut", name="get_statut_getAllStatut", methods={"get"})
     */
    public function getAllStatut(): Response {
        $statutJson = $this->serializer->serialize($this->statutRepository->findAll(),"json");
        return new JsonResponse($statutJson, Response::HTTP_OK, [], true);
    }

    private function validatorErrors(Commande $commande): ?Response {
        $errors = $this->validator->validate($commande);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
