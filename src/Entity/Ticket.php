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

    #[ORM\Column(type: Types::DATETIMETZ_MUTABLE)]
    private ?\DateTime $CloseDate = null;

    #[ORM\Column(type: 'string', enumType: TicketStatus::class)]
    private TicketStatus $status = TicketStatus::Open;

    #[ORM\ManyToOne(targetEntity: User::class)]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    public function __construct()
    {
        $this->technician = new ArrayCollection();
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

    public function getStatus(): SupportStatus
    {
        return $this->status;
    }
    
    public function setStatus(SupportStatus $status): static
    {
        $this->status = $status;
        return $this;
    }
}
