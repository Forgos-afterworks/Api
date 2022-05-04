<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * ProduitDeclinaison
 *
 * @ORM\Table(name="produit_declinaison", indexes={@ORM\Index(name="id_produit", columns={"id_produit"}), @ORM\Index(name="id_declinaison", columns={"id_declinaison"})})
 * @ORM\Entity(repositoryClass="App\Repository\ProduitDeclinaisonRepository")
 */
class ProduitDeclinaison {
    /**
     * @var int
     *
     * @ORM\Column(name="id_produit_declinaison", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups("commande_groups")
     */
    private $idProduitDeclinaison;

    /**
     * @var \Declinaison
     *
     * @ORM\ManyToOne(targetEntity="Declinaison")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_declinaison", referencedColumnName="id_declinaison")
     * })
     * @Groups("commande_groups")
     */
    private $idDeclinaison;

    /**
     * @var \Produit
     *
     * @ORM\ManyToOne(targetEntity="Produit")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_produit", referencedColumnName="id_produit")
     * })
     * @Groups("commande_groups")
     */
    private $idProduit;

    public function getIdProduitDeclinaison(): ?int
    {
        return $this->idProduitDeclinaison;
    }

    public function getIdDeclinaison(): ?Declinaison
    {
        return $this->idDeclinaison;
    }

    public function setIdDeclinaison(?Declinaison $idDeclinaison): self
    {
        $this->idDeclinaison = $idDeclinaison;

        return $this;
    }

    public function getIdProduit(): ?Produit
    {
        return $this->idProduit;
    }

    public function setIdProduit(?Produit $idProduit): self
    {
        $this->idProduit = $idProduit;

        return $this;
    }


}
