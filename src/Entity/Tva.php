<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Tva
 *
 * @ORM\Table(name="tva")
 * @ORM\Entity(repositoryClass="App\Repository\TvaRepository")
 */
class Tva {
    /**
     * @var int
     *
     * @ORM\Column(name="id_tva", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups({"commande_groups", "commandeDeclinaison_groups", "produit_read"})
     */
    private $idTva;

    /**
     * @var int
     *
     * @ORM\Column(name="pourcentage", type="integer", nullable=false)
     * @Groups({"commande_groups", "commandeDeclinaison_groups", "produit_read"})
     */
    private $pourcentage;

    public function getIdTva(): ?int
    {
        return $this->idTva;
    }

    public function getPourcentage(): ?int
    {
        return $this->pourcentage;
    }

    public function setPourcentage(int $pourcentage): self
    {
        $this->pourcentage = $pourcentage;

        return $this;
    }


}
