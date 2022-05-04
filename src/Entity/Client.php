<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Client
 *
 * @ORM\Table(name="client")
 * @ORM\Entity(repositoryClass="App\Repository\ClientRepository")
 */
class Client implements UserInterface, PasswordAuthenticatedUserInterface {
    /**
     * @var int
     *
     * @ORM\Column(name="id_client", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups({"client_read", "comment_read"})
     */
    private $idClient;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="string", length=50, nullable=false)
     * @Groups({"client_read", "comment_read"})
     */
    private $prenom;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=50, nullable=false)
     * @Groups({"client_read", "comment_read"})
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="mail", type="string", length=50, nullable=false, unique=true)
     * @Groups({"client_read", "comment_read"})
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="CP_adresse", type="string", length=50, nullable=false)
     * @Groups("client_read")
     */
    private $cpAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="lib_adresse", type="string", length=50, nullable=false)
     * @Groups("client_read")
     */
    private $libAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="ville_adresse", type="string", length=50, nullable=false)
     * @Groups("client_read")
     */
    private $villeAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="tel", type="string", length=50, nullable=false)
     * @Groups("client_read")
     */
    private $tel;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=50, nullable=false)
     * @var string The hashed password
     */
    private $password;

    /**
     * @var boolean
     *
     * @ORM\Column(name="newsletter", type="boolean", nullable=false)
     * @Groups("client_read")
     */
    private $newsletter;

    /**
     * @ORM\Column(name="role_JWT", type="json")
     */
    private $roles = [];

    public function getIdClient(): ?int {
        return $this->idClient;
    }

    /**
     * @return string
     */
    public function getPrenom(): string {
        return $this->prenom;
    }

    /**
     * @param string $prenom
     */
    public function setPrenom(string $prenom): void {
        $this->prenom = $prenom;
    }

    public function getNom(): ?string {
        return $this->nom;
    }

    public function setNom(string $nom): self {
        $this->nom = $nom;

        return $this;
    }

    /**
     * @return string
     */
    public function getEmail(): string {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email): void {
        $this->email = $email;
    }

    public function getCpAdresse(): ?string {
        return $this->cpAdresse;
    }

    public function setCpAdresse(string $cpAdresse): self {
        $this->cpAdresse = $cpAdresse;

        return $this;
    }

    public function getLibAdresse(): ?string {
        return $this->libAdresse;
    }

    public function setLibAdresse(string $libAdresse): self {
        $this->libAdresse = $libAdresse;

        return $this;
    }

    public function getVilleAdresse(): ?string {
        return $this->villeAdresse;
    }

    public function setVilleAdresse(string $villeAdresse): self {
        $this->villeAdresse = $villeAdresse;

        return $this;
    }

    public function getTel(): ?string {
        return $this->tel;
    }

    public function setTel(string $tel): self {
        $this->tel = $tel;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string {
        return $this->password;
    }

    public function setPassword(string $password): self {
        $this->password = $password;

        return $this;
    }

    public function getNewsletter() {
        return $this->newsletter;
    }

    public function setNewsletter($newsletter): self {
        $this->newsletter = $newsletter;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string {
        return (string)$this->email;
    }

    /**
     * @deprecated since Symfony 5.3, use getUserIdentifier instead
     */
    public function getUsername(): string {
        return (string)$this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self {
        $this->roles = $roles;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials() {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }
}
