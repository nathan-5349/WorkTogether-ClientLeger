<?php
namespace App\Enum;

enum UnitStatus: string
{
    case Available = 'Libre';
    case Unavailable = 'Occupé';
    case Maintenance = 'Maintenance';
}