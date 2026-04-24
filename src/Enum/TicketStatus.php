<?php

declare(strict_types=1);

namespace App\Enum;

enum TicketStatus: string
{
    case Open = 'Ouvert';
    case InProgress = 'En cours';
    case Resolved = 'Résolu';
    case Abandoned = 'Abandonné';
}
