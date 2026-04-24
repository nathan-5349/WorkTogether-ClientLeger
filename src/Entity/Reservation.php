<?php

declare(strict_types=1);

namespace App\Entity;

use App\Enum\ReservationStatus;
use App\Repository\ReservationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

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

    public function getOffer(): ?Offer
    {
        return $this->offer;
    }

    public function setOffer(?Offer $offer): static
    {
        $this->offer = $offer;

        return $this;
    }

    public function getCustomer(): ?Customer
    {
        return $this->customer;
    }

    public function setCustomer(?Customer $customer): static
    {
        $this->customer = $customer;

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
        }

        return $this;
    }

    public function removeUnit(Unit $unit): static
    {
        $this->units->removeElement($unit);

        return $this;
    }

    public function getStatus(): ReservationStatus
    {
        return $this->status;
    }

    public function setStatus(ReservationStatus $status): static
    {
        $this->status = $status;

        return $this;
    }
}
