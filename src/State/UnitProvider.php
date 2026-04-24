<?php

namespace App\State;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use Symfony\Bundle\SecurityBundle\Security;
use App\Entity\Customer;

class UnitProvider implements ProviderInterface
{
    public function __construct(private Security $security)
    {}

    public function provide(Operation $operation, array $uriVariables = [], array $context = []): object|array|null
    {
        $user = $this->security->getUser();
        if (!$user instanceof Customer) return [];

        // Logique pour récupérer toutes les unités du client
        $units = [];
        foreach ($user->getReservations() as $res) {
            foreach ($res->getUnits() as $unit) {
                $units[] = $unit;
            }
        }

        // Si on demande une unité précise (/api/units/5)
        if (isset($uriVariables['id'])) {
            return collect($units)->first(fn($u) => $u->getId() == $uriVariables['id']);
        }

        return $units;
    }
}