<?php

namespace App\Entity;

use App\Repository\CustomerRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use App\Entity\Notice;

#[ORM\Entity(repositoryClass: CustomerRepository::class)]
class Customer
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 200)]
    private ?string $adress = null;

    #[ORM\Column(length: 20)]
    private ?string $phone = null;

    #[ORM\Column(length: 200)]
    private ?string $invoiceAdress = null;

    #[ORM\OneToMany(mappedBy: 'customer', targetEntity: Notice::class, orphanRemoval: true)]
    private Collection $notices;

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

    public function __construct()
    {
        $this->notices = new ArrayCollection();
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
}
