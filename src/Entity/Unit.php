<?php

declare(strict_types=1);

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use App\Enum\UnitStatus;
use App\Repository\UnitRepository;
use App\State\UnitProvider;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ApiResource(
    normalizationContext: ['groups' => ['unit:read']],
    operations: [
        new GetCollection(provider: UnitProvider::class),
        new Get(provider: UnitProvider::class),
    ]
)]
#[ORM\Entity(repositoryClass: UnitRepository::class)]
class Unit
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['unit:read'])]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $position = null;

    #[ORM\Column(length: 30)]
    #[Groups(['unit:read', 'intervention:read'])]
    private ?string $name = null;

    #[ORM\ManyToOne(inversedBy: 'units')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['unit:read', 'intervention:read'])]
    private ?Bay $bay = null;

    #[ORM\ManyToMany(targetEntity: Reservation::class, mappedBy: 'units')]
    private Collection $reservations;

    #[ORM\Column(type: 'string', enumType: UnitStatus::class)]
    #[Groups(['unit:read'])]
    private UnitStatus $status = UnitStatus::Available;

    #[ORM\Column(length: 50, nullable: true)]
    #[Groups(['unit:read'])]
    private ?string $type = null;

    #[ORM\ManyToMany(targetEntity: Intervention::class, mappedBy: 'units')]
    private Collection $interventions;

    #[ORM\Column(nullable: true)]
    #[Groups(['unit:read'])]
    private ?int $powerConsumption = null;

    #[ORM\Column(nullable: true)]
    #[Groups(['unit:read'])]
    private ?float $temperature = null;

    #[ORM\Column(nullable: true)]
    #[Groups(['unit:read'])]
    private ?float $networkThroughput = null;

    public function __construct()
    {
        $this->reservations = new ArrayCollection();
        $this->interventions = new ArrayCollection();
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

    public function getStatus(): UnitStatus
    {
        return $this->status;
    }

    public function setStatus(UnitStatus $status): static
    {
        $this->status = $status;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(?string $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getInterventions(): Collection
    {
        return $this->interventions;
    }

    public function addIntervention(Intervention $intervention): static
    {
        if (!$this->interventions->contains($intervention)) {
            $this->interventions->add($intervention);
            $intervention->addUnit($this);
        }

        return $this;
    }

    public function removeIntervention(Intervention $intervention): static
    {
        if ($this->interventions->removeElement($intervention)) {
            $intervention->removeUnit($this);
        }

        return $this;
    }

    public function getPowerConsumption(): ?int
    {
        return $this->powerConsumption;
    }

    public function setPowerConsumption(?int $powerConsumption): static
    {
        $this->powerConsumption = $powerConsumption;

        return $this;
    }

    public function getTemperature(): ?float
    {
        return $this->temperature;
    }

    public function setTemperature(?float $temperature): static
    {
        $this->temperature = $temperature;

        return $this;
    }

    public function getNetworkThroughput(): ?float
    {
        return $this->networkThroughput;
    }

    public function setNetworkThroughput(?float $networkThroughput): static
    {
        $this->networkThroughput = $networkThroughput;

        return $this;
    }

    #[Groups(['unit:read', 'intervention:read'])]
    public function getFullLocation(): string
    {
        return ($this->bay ? $this->bay->getName() : 'N/A').'-'.$this->name;
    }
}
