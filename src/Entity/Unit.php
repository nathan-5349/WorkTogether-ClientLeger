<?php

namespace App\Entity;

use App\Repository\UnitRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use App\Entity\Bay;
use App\Enum\UnitStatus;

#[ORM\Entity(repositoryClass: UnitRepository::class)]
class Unit
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $position = null;

    #[ORM\Column(length: 30)]
    private ?string $name = null;

    #[ORM\ManyToOne(inversedBy: 'units')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Bay $bay = null;

    #[ORM\ManyToMany(targetEntity: Reservation::class, mappedBy: 'units')]
    private Collection $reservations;

    #[ORM\Column(type: 'string', enumType: UnitStatus::class)]
    private UnitStatus $status = UnitStatus::Available;

    public function __construct()
    {
        $this->reservations = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }
    
    public function getPosition(): ?int
    {
        return $this->position;
        }
    public function setPosition(int $position): static
    {
        $this->position = $position;

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

    public function getBay(): ?Bay
    {
        return $this->bay;
    }
    public function setBay(?Bay $bay): static
    {
        $this->bay = $bay;

        return $this;
    }

    public function getReservations(): Collection
    {
        return $this->reservations;
    }
    public function addReservation(Reservation $reservation): static
    {
        if (!$this->reservations->contains($reservation)) {
            $this->reservations->add($reservation);
            $reservation->setUnit($this);
        }

        return $this;
    }
    public function removeReservation(Reservation $reservation): static
    {
        if ($this->reservations->removeElement($reservation)) {
            // set the owning side to null (unless already changed)
            if ($reservation->getUnit() === $this) {
                $reservation->setUnit(null);
            }
        return $this;
        }
    }
}