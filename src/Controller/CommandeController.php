<?php

namespace App\Controller;

use App\Repository\CommandeDeclinaisonRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class CommandeController extends AbstractController {

    private EntityManagerInterface $entityManager;
    private SerializerInterface $serializer;
    private CommandeDeclinaisonRepository $commandeDeclinaisonRepository;

    public function __construct(EntityManagerInterface $entityManager, SerializerInterface $serializer,
                                CommandeDeclinaisonRepository $commandeDeclinaisonRepository) {
        $this->entityManager = $entityManager;
        $this->serializer = $serializer;
        $this->commandeDeclinaisonRepository = $commandeDeclinaisonRepository;
    }

    /**
     * @Route("/api/commandes", name="get_commande_getCommandes", methods={"GET"})
     */
    public function getCommandes(): Response {
        $articlesJson = $this->serializer->serialize($this->commandeDeclinaisonRepository->findAll(), "json");
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }
}
