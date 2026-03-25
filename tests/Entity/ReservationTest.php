<?php

namespace App\Tests\Entity;

use PHPUnit\Framework\TestCase;
use App\Entity\Reservation;

class ReservationTest extends TestCase
{
    public function testDuration(): void
    {
        $reservation = new Reservation();
        $reservation->setBeginDate(new \DateTimeImmutable('2022-01-01'));
        $reservation->setFinsishDate(new \DateTimeImmutable('2022-01-02'));
        $this->assertEquals(2, $reservation->getDuration());
    }
}
