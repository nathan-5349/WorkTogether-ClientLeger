<?php

declare(strict_types=1);

namespace App\State;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Entity\Customer;
use Symfony\Bundle\SecurityBundle\Security;

class InterventionProvider implements ProviderInterface
{
    public function __construct(private Security $security)
    {
    }

    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $user = $this->security->getUser();

        if (!$user instanceof Customer) {
            return [];
        }

        $interventions = [];
        foreach ($user->getReservations() as $reservation) {
            foreach ($reservation->getUnits() as $unit) {
                foreach ($unit->getInterventions() as $intervention) {
                    if (!\in_array($intervention, $interventions)) {
                        $interventions[] = $intervention;
                    }
                }
            }
        }

        return $interventions;
    }
}
