<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Employe;
use App\Repository\ArticleRepository;
use App\Repository\EmployeRepository;
use App\Repository\RubriqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ArticleController extends AbstractController {

    private ArticleRepository $articleRepository;
    private SerializerInterface $serializer;
    private ValidatorInterface $validator;
    private EntityManagerInterface $entityManager;
    private RubriqueRepository $rubriqueRepository;

    public function __construct(ArticleRepository $articleRepository, SerializerInterface $serializer,
                                ValidatorInterface $validator, EntityManagerInterface $entityManager,
                                RubriqueRepository $rubriqueRepository) {
        $this->articleRepository = $articleRepository;
        $this->serializer = $serializer;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->rubriqueRepository = $rubriqueRepository;
    }

    /**
     * @Route("/api/articles", name="get_article_getAllArticles", methods={"GET"})
     */
    public function getAllArticles(): Response {
        $articlesJson = $this->serializer->serialize($this->articleRepository->findAll(), "json", ["groups" => "article_read"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/articles/{idArticle}", name="get_article_getArticleById", methods={"GET"})
     */
    public function getArticleById(int $idArticle): Response {
        $articlesJson = $this->serializer->serialize($this->articleRepository->findBy(["idArticle" => $idArticle])[0],
            "json", ["groups" => "article_read"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }


    /**
     * @Route("/api/articles", name="api_article_createArticle", methods={"POST"})
     */
    public function createArticle(Request $request): Response {
        $bodyContent = $request->getContent();
        $infos = json_decode($bodyContent, true);
        try {
            $article = $this->serializer->deserialize($bodyContent, Article::class, "json");

            if (!($this->getUser() instanceof Employe)) throw new \Exception("Authorisation rejettée");
            $article->setIdEmploye($this->getUser());

            $date = new \DateTime();
            $article->setDateCreation($date);

            $rubrique = $this->rubriqueRepository->find($infos["idRubrique"]);
            $article->setIdRubrique($rubrique);

            $errors = $this->validatorErrors($article);
            if (!is_null($errors)) return $errors;

            $this->entityManager->persist($article);
            $this->entityManager->flush();

            $categorieJson = $this->serializer->serialize($article, "json", ["groups" => "article_read"]);
            return new JsonResponse($categorieJson, Response::HTTP_CREATED, [], true);
        } //Je vais intercepter une éventuelle exception
        catch (\Exception $exception) {
            $error = [
                "status" => Response::HTTP_BAD_REQUEST,
                "message" => "Le JSON envoyer dans la requete n'est pas valide."
            ];
            return new JsonResponse(json_encode($error), $error["status"], [], true);
        }
    }

    /**
     * @Route("/api/articles/{idRubric}", name="get_article_getArticlesByRubric", methods={"GET"})
     */
    public function getArticlesByRubric(int $idRubric): Response {
        $articlesJson = $this->serializer->serialize($this->articleRepository->findBy(["idRubrique" => $idRubric]),
            "json", ["groups" => "article_read"]);
        return new JsonResponse($articlesJson, Response::HTTP_OK, [], true);
    }

    private function validatorErrors(Article $article): ?Response {
        $errors = $this->validator->validate($article);
        if (count($errors)) {
            $errorsJSON = $this->serializer->serialize($errors, "json");
            return new JsonResponse($errorsJSON, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
