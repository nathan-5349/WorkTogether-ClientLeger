<?php

namespace App\Entity;

use App\Repository\ReservationRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use App\Entity\Offer;
use App\Entity\Customer;
use App\Entity\Unit;
use App\Enum\ReservationStatus;

#[ORM\Entity(repositoryClass: ReservationRepository::class)]
class Reservation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $beginDate = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $finishDate = null;

    #[ORM\ManyToOne(targetEntity: Offer::class, inversedBy: 'reservations')]
    #[ORM\JoinColumn(name: 'reservation_offer')]
    private ?Offer $offer = null;

    #[ORM\ManyToOne(targetEntity: Customer::class, inversedBy: 'reservations')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Customer $customer = null;

    #[ORM\ManyToMany(targetEntity: Unit::class)]
    #[ORM\JoinTable(name: 'reservation_unit')]
    private Collection $units;

    #[ORM\Column(type: 'string', enumType: ReservationStatus::class)]
    private ReservationStatus $status = ReservationStatus::Pending;

    public function __construct()
    {
        $this->offers = new ArrayCollection();
        $this->units = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBeginDate(): ?\DateTimeImmutable
    {
        return $this->beginDate;
    }

    public function setBeginDate(\DateTimeImmutable $beginDate): static
    {
        $this->beginDate = $beginDate;

        return $this;
    }

    public function getFinishDate(): ?\DateTimeImmutable
    {
        return $this->finishDate;
    }

    public function setFinishDate(\DateTimeImmutable $finishDate): static
    {
        $this->finishDate = $finishDate;

        return $this;
    }

    public function getOffer(): Collection
    {
        return $this->offers;
    }
    public function addOffer(Offer $offer): static
    {
        if (!$this->offers->contains($offer)) {
            $this->offers->add($offer);
        }

        return $this;
    }
    public function removeOffer(Offer $offer): static
    {
        $this->offers->removeElement($offer);

        return $this;
    }

    public function getUnits (): Collection
    {
        return $this->units;
    }
    public function addUnit(Unit $unit): static
    {
        if (!$this->units->contains($unit)) {
            $this->units->add($unit);
        }
        
        return $this;
    }
    public function removeUnit(Unit $unit): static
    {
        $this->units->removeElement($unit);

        return $this;
    }
}
