<?php

declare(strict_types=1);

namespace App\Entity;

use App\Repository\TechnicianRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TechnicianRepository::class)]
class Technician extends User
{
    #[ORM\Column(length: 14)]
    private ?string $phone = null;

    #[ORM\Column(type: Types::SMALLINT)]
    private ?int $level = null;

    public function getLevel(): ?int
    {
        return $this->level;
    }

    public function setLevel(int $level): static
    {
        $this->level = $level;

        return $this;
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
}
