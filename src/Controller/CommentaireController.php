<?php

namespace App\Controller;

use App\Entity\Commentaire;
use App\Repository\ClientRepository;
use App\Repository\CommentaireRepository;
use App\Repository\ProduitDeclinaisonRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CommentaireController extends AbstractController
{

    private SerializerInterface $serializer;
    private CommentaireRepository $commentaireRepository;
    private ClientRepository $clientRepository;
    private ProduitDeclinaisonRepository $produitDeclinaisonRepository;

    public function __construct(SerializerInterface $serializer, CommentaireRepository $commentaireRepository,
                                ClientRepository $clientRepository, ProduitDeclinaisonRepository $produitDeclinaisonRepository,
                                ValidatorInterface $validator, EntityManagerInterface $entityManager) {
        $this->serializer = $serializer;
        $this->commentaireRepository = $commentaireRepository;
        $this->clientRepository = $clientRepository;
        $this->produitDeclinaisonRepository = $produitDeclinaisonRepository;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/api/comments", name="get_comment_getAllComments", methods={"GET"})
     */
    public function getAllComments(): Response
    {
        $produitsJson = $this->serializer->serialize($this->commentaireRepository->findAll(), "json");
        return new JsonResponse($produitsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/comments/{idProduit}", name="get_comment_getAllComments", methods={"GET"})
     */
    public function getCommentsByIdProduit($idProduit): Response
    {
        $produitsJson = $this->serializer->serialize($this->commentaireRepository->findBy(["idProduit" => $idProduit]), "json");
        return new JsonResponse($produitsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/comments", name="api_comment_createComment", methods={"POST"})
     */
    public function createComment(Request $request): Response {
        $bodyContent = $request->getContent();
        $infos = json_decode($bodyContent, true);
        try {
            $comment = $this->serializer->deserialize($bodyContent, Commentaire::class, "json");

            $date = new \DateTime();
            $comment->setDate($date);

            $client = $this->getUser();
            $comment->setIdClient($client);

            $prodDecl = $this->produitDeclinaisonRepository->findBy(["idProduit" => ["idProduit" => $infos["idProduit"]]]);
            $comment->setIdProduitDeclinaison($prodDecl[0]);

            $errors = $this->validatorErrors($comment);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($comment);
            $this->entityManager->flush();

            $commentJson = $this->serializer->serialize($comment, "json");
            return new JsonResponse($commentJson, Response::HTTP_CREATED, [], true);
        } //Je vais intercepter une éventuelle exception
        catch (\Exception $exception) {
            $error = [
                "status" => Response::HTTP_BAD_REQUEST,
                "message" => "Le JSON envoyer dans la requete n'est pas valide."
            ];
            return new JsonResponse(json_encode($error), $error["status"], [], true);
        }
    }

    private function validatorErrors(Commentaire $commentaire): ?Response {
        $errors = $this->validator->validate($commentaire);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
