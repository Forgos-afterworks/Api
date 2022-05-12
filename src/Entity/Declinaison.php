<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Declinaison
 *
 * @ORM\Table(name="declinaison")
 * @ORM\Entity(repositoryClass="App\Repository\DeclinaisonRepository")
 */
class Declinaison
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_declinaison", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $idDeclinaison;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=50, nullable=false)
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", length=65535, nullable=false)
     * @Groups({"commande_groups", "commandeDeclinaison_groups"})
     */
    private $description;

    public function getIdDeclinaison(): ?int
    {
        return $this->idDeclinaison;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }


}
