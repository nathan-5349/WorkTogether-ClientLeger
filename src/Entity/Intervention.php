<?php

declare(strict_types=1);

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use App\Repository\InterventionRepository;
use App\State\InterventionProvider;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ApiResource(
    normalizationContext: ['groups' => ['intervention:read']],
    operations: [
        new GetCollection(provider: InterventionProvider::class),
        new Get(provider: InterventionProvider::class),
    ]
)]
#[ORM\Entity(repositoryClass: InterventionRepository::class)]
class Intervention
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['intervention:read'])]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    #[Groups(['intervention:read'])]
    private ?string $type = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Groups(['intervention:read'])]
    private ?string $description = null;

    #[ORM\Column(type: Types::DATETIMETZ_MUTABLE)]
    #[Groups(['intervention:read'])]
    private ?\DateTime $beginDate = null;

    #[ORM\Column(type: Types::DATETIMETZ_MUTABLE)]
    #[Groups(['intervention:read'])]
    private ?\DateTime $finishDate = null;

    #[ORM\ManyToMany(targetEntity: Unit::class)]
    #[ORM\JoinTable(name: 'intervention_unit')]
    #[Groups(['intervention:read'])]
    private Collection $units;

    public function __construct()
    {
        $this->units = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): static
    {
        $this->id = $id;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): static
    {
        $this->type = $type;

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

    public function getBeginDate(): ?\DateTime
    {
        return $this->beginDate;
    }

    public function setBeginDate(\DateTime $beginDate): static
    {
        $this->beginDate = $beginDate;

        return $this;
    }

    public function getFinishDate(): ?\DateTime
    {
        return $this->finishDate;
    }

    public function setFinishDate(\DateTime $finishDate): static
    {
        $this->finishDate = $finishDate;

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
}
