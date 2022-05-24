<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Article
 *
 * @ORM\Table(name="article", indexes={@ORM\Index(name="id_employe", columns={"id_employe"}), @ORM\Index(name="id_rubrique", columns={"id_rubrique"})})
 * @ORM\Entity(repositoryClass="App\Repository\ArticleRepository")
 */
class Article
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_article", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups("article_read")
     */
    private $idArticle;

    /**
     * @var string
     *
     * @ORM\Column(name="titre", type="string", length=50, nullable=false)
     * @Groups("article_read")
     */
    private $titre;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_creation", type="date", nullable=false)
     * @Groups("article_read")
     */
    private $dateCreation;

    /**
     * @var string
     *
     * @ORM\Column(name="contenue", type="text", length=65535, nullable=false)
     * @Groups("article_read")
     */
    private $contenue;

    /**
     * @var \Rubrique
     *
     * @ORM\ManyToOne(targetEntity="Rubrique")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_rubrique", referencedColumnName="id_rubrique")
     * })
     * @Groups("article_read")
     */
    private $idRubrique;

    /**
     * @var \Employe
     *
     * @ORM\ManyToOne(targetEntity="Employe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_employe", referencedColumnName="id_employe")
     * })
     * @Groups("article_read")
     */
    private $idEmploye;

    public function getIdArticle(): ?int
    {
        return $this->idArticle;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getDateCreation(): ?\DateTimeInterface
    {
        return $this->dateCreation;
    }

    public function setDateCreation(\DateTimeInterface $dateCreation): self
    {
        $this->dateCreation = $dateCreation;

        return $this;
    }

    public function getContenue(): ?string
    {
        return $this->contenue;
    }

    public function setContenue(string $contenue): self
    {
        $this->contenue = $contenue;

        return $this;
    }

    public function getIdRubrique(): ?Rubrique
    {
        return $this->idRubrique;
    }

    public function setIdRubrique(?Rubrique $idRubrique): self
    {
        $this->idRubrique = $idRubrique;

        return $this;
    }

    public function getIdEmploye(): ?Employe
    {
        return $this->idEmploye;
    }

    public function setIdEmploye(?Employe $idEmploye): self
    {
        $this->idEmploye = $idEmploye;

        return $this;
    }


}
