<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Afttable
 *
 * @ORM\Table(name="afttable")
 * @ORM\Entity(repositoryClass="App\Repository\AfttableRepository")
 */
class Afttable
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_table", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idTable;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=5, nullable=false)
     */
    private $nom;

    public function getIdTable(): ?int
    {
        return $this->idTable;
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


}
