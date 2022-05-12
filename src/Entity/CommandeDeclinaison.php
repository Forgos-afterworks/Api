<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

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
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idCommandeDeclinaison;

    /**
     * @var int
     *
     * @ORM\Column(name="quantitee", type="integer", nullable=false)
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $quantitee;

    /**
     * @var float
     *
     * @ORM\Column(name="prix_HT", type="float", precision=10, scale=0, nullable=false)
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $prixHt;

    /**
     * @var \ProduitDeclinaison
     *
     * @ORM\ManyToOne(targetEntity="ProduitDeclinaison")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_produit_declinaison", referencedColumnName="id_produit_declinaison")
     * })
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idProduitDeclinaison;

    /**
     * @var \Commande
     *
     * @ORM\ManyToOne(targetEntity="Commande")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_commande", referencedColumnName="id_commande")
     * })
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idCommande;

    public function getIdCommandeDeclinaison(): ?int {
        return $this->idCommandeDeclinaison;
    }

    public function getQuantitee(): ?int {
        return $this->quantitee;
    }

    public function setQuantitee(int $quantitee): self {
        $this->quantitee = $quantitee;

        return $this;
    }

    public function getPrixHt(): ?float {
        return $this->prixHt;
    }

    public function setPrixHt(float $prixHt): self {
        $this->prixHt = $prixHt;

        return $this;
    }

    public function getIdProduitDeclinaison(): ?ProduitDeclinaison {
        return $this->idProduitDeclinaison;
    }

    public function setIdProduitDeclinaison(?ProduitDeclinaison $idProduitDeclinaison): self {
        $this->idProduitDeclinaison = $idProduitDeclinaison;

        return $this;
    }

    public function getIdCommande(): ?Commande {
        return $this->idCommande;
    }

    public function setIdCommande(?Commande $idCommande): self {
        $this->idCommande = $idCommande;

        return $this;
    }


}
