<?php

namespace App\State;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use Symfony\Bundle\SecurityBundle\Security;
use App\Entity\Customer;
use App\Entity\Intervention;

class InterventionProvider implements ProviderInterface
{
    public function __construct(private Security $security)
    {}

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
                    if (!in_array($intervention, $interventions)) {
                        $interventions[] = $intervention;
                    }
                }
            }
        }

        return $interventions;
    }
}