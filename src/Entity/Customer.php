<?php

declare(strict_types=1);

namespace App\Entity;

use App\Repository\CustomerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CustomerRepository::class)]
abstract class Customer extends User
{
    #[ORM\Column(length: 200)]
    private ?string $adress = null;

    #[ORM\Column(length: 20)]
    private ?string $phone = null;

    #[ORM\Column(length: 200)]
    private ?string $invoiceAdress = null;

    #[ORM\OneToMany(mappedBy: 'customer', targetEntity: Notice::class, orphanRemoval: true)]
    private Collection $notices;

    #[ORM\OneToMany(mappedBy: 'customer', targetEntity: Reservation::class)]
    private Collection $reservations;

    public function __construct()
    {
        $this->notices = new ArrayCollection();
        $this->reservations = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(string $phone): static
    {
        $this->phone = $phone;

        return $this;
    }

    public function getAdress(): ?string
    {
        return $this->adress;
    }

    public function setAdress(string $adress): static
    {
        $this->adress = $adress;

        return $this;
    }

    public function getInvoiceAdress(): ?string
    {
        return $this->invoiceAdress;
    }

    public function setInvoiceAdress(string $invoiceAdress): static
    {
        $this->invoiceAdress = $invoiceAdress;

        return $this;
    }

    public function getNotices(): Collection
    {
        return $this->notices;
    }

    public function addNotice(Notice $notice): static
    {
        if (!$this->notices->contains($notice)) {
            $this->notices->add($notice);
            $notice->setCustomer($this);
        }

        return $this;
    }

    public function removeNotice(Notice $notice): static
    {
        if ($this->notices->removeElement($notice)) {
            if ($notice->getCustomer() === $this) {
                $notice->setCustomer(null);
            }
        }

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
            $reservation->setCustomer($this);
        }

        return $this;
    }

    public function removeReservation(Reservation $reservation): static
    {
        if ($this->reservations->removeElement($reservation)) {
            if ($reservation->getCustomer() === $this) {
                $reservation->setCustomer(null);
            }
        }

        return $this;
    }

    // Utile pour détecter le type de client
    public function isParticular(): bool
    {
        return $this instanceof Particular;
    }
}
