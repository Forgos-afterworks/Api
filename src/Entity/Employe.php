<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Employe
 *
 * @ORM\Table(name="employe", indexes={@ORM\Index(name="id_role", columns={"id_role"})})
 * @ORM\Entity(repositoryClass="App\Repository\EmployeRepository")
 */
class Employe implements UserInterface, PasswordAuthenticatedUserInterface {
    /**
     * @var int
     *
     * @ORM\Column(name="id_employe", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups({"article_read", "employe_read"})
     */
    private $idEmploye;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=50, nullable=false)
     * @Groups({"article_read", "employe_read"})
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="mail", type="string", length=50, nullable=false, unique=true)
     * @Groups({"article_read", "employe_read"})
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="string", length=50, nullable=false)
     * @Groups({"article_read", "employe_read"})
     */
    private $prenom;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=50, nullable=false)
     * @var string The hashed password
     */
    private $password;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_embauche", type="date", nullable=false)
     * @Groups("employe_read")
     */
    private $dateEmbauche;

    /**
     * @var string
     *
     * @ORM\Column(name="lib_adresse", type="string", length=50, nullable=false)
     * @Groups("employe_read")
     */
    private $libAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="CP_adresse", type="string", length=50, nullable=false)
     * @Groups("employe_read")
     */
    private $cpAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="ville_adresse", type="string", length=50, nullable=false)
     * @Groups("employe_read")
     */
    private $villeAdresse;

    /**
     * @var \Role
     *
     * @ORM\ManyToOne(targetEntity="Role")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_role", referencedColumnName="id_role")
     * })
     * @Groups("employe_read")
     */
    private $idRole;

    /**
     * @ORM\Column(name="role_JWT", type="json")
     */
    private $roles = [];

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

    /**
     * @see UserInterface
     */
    public function getRoles(): array {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_EMPLOYE';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self {
        $this->roles = $roles;

        return $this;
    }

    public function getIdEmploye(): ?int {
        return $this->idEmploye;
    }

    public function getNom(): ?string {
        return $this->nom;
    }

    public function setNom(string $nom): self {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self {
        $this->prenom = $prenom;

        return $this;
    }

    public function getDateEmbauche(): ?\DateTimeInterface {
        return $this->dateEmbauche;
    }

    public function setDateEmbauche(\DateTimeInterface $dateEmbauche): self {
        $this->dateEmbauche = $dateEmbauche;

        return $this;
    }

    public function getLibAdresse(): ?string {
        return $this->libAdresse;
    }

    public function setLibAdresse(string $libAdresse): self {
        $this->libAdresse = $libAdresse;

        return $this;
    }

    public function getCpAdresse(): ?string {
        return $this->cpAdresse;
    }

    public function setCpAdresse(string $cpAdresse): self {
        $this->cpAdresse = $cpAdresse;

        return $this;
    }

    public function getVilleAdresse(): ?string {
        return $this->villeAdresse;
    }

    public function setVilleAdresse(string $villeAdresse): self {
        $this->villeAdresse = $villeAdresse;

        return $this;
    }

    public function getIdRole(): ?Role {
        return $this->idRole;
    }

    public function setIdRole(?Role $idRole): self {
        $this->idRole = $idRole;

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
}
