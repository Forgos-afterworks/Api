<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CommandeDeclinaison
 *
 * @ORM\Table(name="commande_declinaison", indexes={@ORM\Index(name="id_commande", columns={"id_commande"}), @ORM\Index(name="id_produit_declinaison", columns={"id_produit_declinaison"})})
 * @ORM\Entity(repositoryClass="App\Repository\CommandeDeclinaisonRepository")
 */
class CommandeDeclinaison {
    /**
     * @var int
     *
     * @ORM\Column(name="id_commande_declinaison", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCommandeDeclinaison;

    /**
     * @var int
     *
     * @ORM\Column(name="quantitee", type="integer", nullable=false)
     */
    private $quantitee;

    /**
     * @var float
     *
     * @ORM\Column(name="prix_HT", type="float", precision=10, scale=0, nullable=false)
     */
    private $prixHt;

    /**
     * @var \ProduitDeclinaison
     *
     * @ORM\ManyToOne(targetEntity="ProduitDeclinaison")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_produit_declinaison", referencedColumnName="id_produit_declinaison")
     * })
     */
    private $idProduitDeclinaison;

    /**
     * @var \Commande
     *
     * @ORM\ManyToOne(targetEntity="Commande")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_commande", referencedColumnName="id_commande")
     * })
     */
    private $idCommande;

    public function getIdCommandeDeclinaison(): ?int
    {
        return $this->idCommandeDeclinaison;
    }

    public function getQuantitee(): ?int
    {
        return $this->quantitee;
    }

    public function setQuantitee(int $quantitee): self
    {
        $this->quantitee = $quantitee;

        return $this;
    }

    public function getPrixHt(): ?float
    {
        return $this->prixHt;
    }

    public function setPrixHt(float $prixHt): self
    {
        $this->prixHt = $prixHt;

        return $this;
    }

    public function getIdProduitDeclinaison(): ?ProduitDeclinaison
    {
        return $this->idProduitDeclinaison;
    }

    public function setIdProduitDeclinaison(?ProduitDeclinaison $idProduitDeclinaison): self
    {
        $this->idProduitDeclinaison = $idProduitDeclinaison;

        return $this;
    }

    public function getIdCommande(): ?Commande
    {
        return $this->idCommande;
    }

    public function setIdCommande(?Commande $idCommande): self
    {
        $this->idCommande = $idCommande;

        return $this;
    }


}
