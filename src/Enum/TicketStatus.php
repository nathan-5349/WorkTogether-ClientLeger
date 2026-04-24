<?php
namespace App\Enum;

enum TicketStatus: string
{
    case Open = 'Ouvert';
    case InProgress = 'En cours';
    case Resolved = 'Résolu';
    case Abandoned = 'Abandonné';
}