<?php

declare(strict_types=1);

namespace App\Entity;

use App\Repository\ParticularRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ParticularRepository::class)]
class Particular extends Customer
{
    #[ORM\Column(length: 14)]
    private ?string $gender = null;

    public function getGender(): ?string
    {
        return $this->gender;
    }

    public function setGender(string $gender): static
    {
        $this->gender = $gender;

        return $this;
    }
}
