<?php

declare(strict_types=1);

namespace App\Enum;

enum UnitStatus: string
{
    case Available = 'Libre';
    case Unavailable = 'Occupé';
    case Maintenance = 'Maintenance';
}
