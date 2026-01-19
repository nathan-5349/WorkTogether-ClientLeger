<?php

namespace App\Entity;

use App\Repository\BayRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\Unit;

#[ORM\Entity(repositoryClass: BayRepository::class)]
class Bay
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $capacityUnit = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): static
    {
        $this->id = $id;

        return $this;
    }

    public function getCapacityUnit(): ?int
    {
        return $this->capacityUnit;
    }

    public function setCapacityUnit(int $capacityUnit): static
    {
        $this->capacityUnit = $capacityUnit;

        return $this;
    }
}
