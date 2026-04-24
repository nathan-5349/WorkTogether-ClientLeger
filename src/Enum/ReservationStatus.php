<?php
namespace App\Enum;

enum ReservationStatus: string
{
    case Pending = 'En attente';
    case Confirmed = 'Confirmée';
    case Cancelled = 'Annulée';
}