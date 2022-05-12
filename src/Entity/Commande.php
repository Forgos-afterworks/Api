<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Commande
 *
 * @ORM\Table(name="commande", indexes={@ORM\Index(name="id_table", columns={"id_table"}), @ORM\Index(name="id_statut", columns={"id_statut"})})
 * @ORM\Entity(repositoryClass="App\Repository\CommandeRepository")
 */
class Commande
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_commande", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idCommande;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="date", nullable=false)
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $date;

    /**
     * @var \Statut
     *
     * @ORM\ManyToOne(targetEntity="Statut")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_statut", referencedColumnName="id_statut")
     * })
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idStatut;

    /**
     * @var \Afttable
     *
     * @ORM\ManyToOne(targetEntity="Afttable")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_table", referencedColumnName="id_table")
     * })
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idTable;

    public function getIdCommande(): ?int
    {
        return $this->idCommande;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getIdStatut(): ?Statut
    {
        return $this->idStatut;
    }

    public function setIdStatut(?Statut $idStatut): self
    {
        $this->idStatut = $idStatut;

        return $this;
    }

    public function getIdTable(): ?Afttable
    {
        return $this->idTable;
    }

    public function setIdTable(?Afttable $idTable): self
    {
        $this->idTable = $idTable;

        return $this;
    }


}
