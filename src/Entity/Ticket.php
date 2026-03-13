<?php

namespace App\Entity;

use App\Repository\TicketRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use App\Enum\TicketStatus;

#[ORM\Entity(repositoryClass: TicketRepository::class)]
class Ticket
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $subject = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\Column(type: Types::DATETIMETZ_MUTABLE)]
    private ?\DateTime $OpenDate = null;

    #[ORM\Column(type: Types::DATETIMETZ_MUTABLE, nullable: true)]
    private ?\DateTime $CloseDate = null;

    #[ORM\Column(type: 'string', enumType: TicketStatus::class)]
    private TicketStatus $status = TicketStatus::Open;

    // Créateur du ticket
    #[ORM\ManyToOne(targetEntity: Customer::class)]
    #[ORM\JoinColumn(nullable: false)]
    private ?Customer $customer = null;

    // Techniciens qui travaillent sur le ticket
    #[ORM\ManyToOne(targetEntity: Technician::class)]
    #[ORM\JoinColumn(nullable: false)]
    private Collection $technicians;

    // Support qui assigne le ticket
    #[ORM\ManyToOne(targetEntity: Support::class)]
    #[ORM\JoinColumn(nullable: false)]
    private ?Support $support = null;


    public function __construct()
    {
        $this->OpenDate = new \DateTime();
        $this->technicians = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSubject(): ?string
    {
        return $this->subject;
    }

    public function setSubject(string $subject): static
    {
        $this->subject = $subject;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getOpenDate(): ?\DateTime
    {
        return $this->OpenDate;
    }

    public function setOpenDate(\DateTime $OpenDate): static
    {
        $this->OpenDate = $OpenDate;

        return $this;
    }

    public function getCloseDate(): ?\DateTime
    {
        return $this->CloseDate;
    }

    public function setCloseDate(\DateTime $CloseDate): static
    {
        $this->CloseDate = $CloseDate;

        return $this;
    }

    public function getStatus(): TicketStatus
    {
        return $this->status;
    }
    
    public function setStatus(TicketStatus $status): static
    {
        $this->status = $status;
        return $this;
    }

    public function getCustomer(): ?User
    {
        return $this->user;
    }

    public function setCustomer(?User $user): static
    {
        $this->user = $user;
    }

    public function getTechnicians(): Collection
    {
        return $this->technicians;
    }

    public function addTechnician(Technician $technician): static
    {
        $this->technicians->add($technician);
        return $this;
    }

    public function removeTechnician(Technician $technician): static
    {
        $this->technicians->removeElement($technician);
        return $this;
    }

    public function getSupport(): ?Support
    {
        return $this->support;
    }

    public function setSupport(?Support $support): static
    {
        $this->support = $support;
        return $this;
    }
}