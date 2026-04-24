<?php

declare(strict_types=1);

namespace App\Entity;

use App\Repository\BayRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: BayRepository::class)]
class Bay
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 25)]
    #[Groups(['unit:read', 'intervention:read'])]
    private ?string $name = null;

    #[ORM\Column]
    private ?int $capacityUnit = null;

    #[ORM\OneToMany(mappedBy: 'bay', targetEntity: Unit::class, orphanRemoval: true)]
    private Collection $units;

    public function __construct()
    {
        $this->units = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getUnits(): Collection
    {
        return $this->units;
    }

    public function addUnit(Unit $unit): static
    {
        if (!$this->units->contains($unit)) {
            $this->units->add($unit);
            $unit->setBay($this);
        }

        return $this;
    }

    public function removeUnit(Unit $unit): static
    {
        if ($this->units->removeElement($unit)) {
            // set the owning side to null (unless already changed)
            if ($unit->getBay() === $this) {
                $unit->setBay(null);
            }
        }

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }
}
