<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\RoleRepository;
use Symfony\Component\Serializer\SerializerInterface;

class RoleController extends AbstractController {

    private RoleRepository $roleRepository;
    private SerializerInterface $serializer;

    public function __construct(RoleRepository $roleRepository, SerializerInterface $serializer) {
        $this->roleRepository = $roleRepository;
        $this->serializer = $serializer;
    }

    /**
     * @Route("/api/roles", name="get_role_getAllRoles", methods="GET")
     */
    public function getAllRoles(): Response {
        $roles = $this->roleRepository->findAll();
        $rolesJson = $this->serializer->serialize($roles, "json");
        return new JsonResponse($rolesJson, Response::HTTP_OK, [], true);
    }
}
