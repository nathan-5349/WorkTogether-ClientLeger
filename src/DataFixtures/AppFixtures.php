<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\Administrator;
use App\Entity\Technician;
use App\Entity\Support;
use App\Entity\Accountant;
use App\Entity\Company;
use App\Entity\Particular;
use App\Entity\Offer;
use App\Entity\Bay;
use App\Entity\Unit;
use App\Entity\Intervention;
use App\Entity\Reservation;
use App\Entity\Notice;
use App\Entity\Ticket;
use App\Enum\ReservationStatus;
use App\Enum\TicketStatus;
use App\Enum\UnitStatus;

class AppFixtures extends Fixture
{
    public function __construct(private UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        // =========================================================
        // STAFF
        // =========================================================

        $administrator = new Administrator();
        $administrator->setEmail('admin@test.fr')
                      ->setFirstName('Sophie')
                      ->setName('Martin')
                      ->setRoles(['ROLE_ADMIN']);
        $administrator->setPassword($this->passwordHasher->hashPassword($administrator, 'admin'));
        $manager->persist($administrator);

        $staffData = [
            ['class' => Accountant::class, 'email' => 'accountant@test.fr', 'role' => 'ROLE_ACCOUNTANT', 'firstName' => 'Pierre',   'name' => 'Dupont'],
            ['class' => Support::class,    'email' => 'support@test.fr',    'role' => 'ROLE_SUPPORT',    'firstName' => 'Marie',    'name' => 'Leblanc'],
            ['class' => Support::class,    'email' => 'support2@test.fr',   'role' => 'ROLE_SUPPORT',    'firstName' => 'Thomas',   'name' => 'Bernard'],
        ];

        foreach ($staffData as $data) {
            $member = new $data['class']();
            $member->setEmail($data['email'])
                   ->setFirstName($data['firstName'])
                   ->setName($data['name'])
                   ->setRoles([$data['role']]);
            $member->setPassword($this->passwordHasher->hashPassword($member, 'staff123'));
            $manager->persist($member);
        }

        // =========================================================
        // TECHNICIENS
        // =========================================================

        $techniciansData = [
            ['email' => 'tech1@test.fr', 'firstName' => 'Lucas',   'name' => 'Moreau',   'phone' => '0611111111', 'level' => 3],
            ['email' => 'tech2@test.fr', 'firstName' => 'Emma',    'name' => 'Petit',    'phone' => '0622222222', 'level' => 2],
            ['email' => 'tech3@test.fr', 'firstName' => 'Nathan',  'name' => 'Simon',    'phone' => '0633333333', 'level' => 1],
        ];

        $technicians = [];
        foreach ($techniciansData as $data) {
            $tech = new Technician();
            $tech->setEmail($data['email'])
                 ->setFirstName($data['firstName'])
                 ->setName($data['name'])
                 ->setPhone($data['phone'])
                 ->setLevel($data['level'])
                 ->setRoles(['ROLE_TECHNICIAN']);
            $tech->setPassword($this->passwordHasher->hashPassword($tech, 'tech123'));
            $manager->persist($tech);
            $technicians[] = $tech;
        }

        // =========================================================
        // CLIENTS PARTICULIERS
        // =========================================================

        $particularsData = [
            ['email' => 'particular@test.fr',  'firstName' => 'Jean',    'name' => 'Durand',   'phone' => '0601010101', 'adress' => '1 rue de la Paix, Paris',       'gender' => 'Monsieur'],
            ['email' => 'particular2@test.fr', 'firstName' => 'Claire',  'name' => 'Fontaine', 'phone' => '0602020202', 'adress' => '5 avenue Victor Hugo, Lyon',    'gender' => 'Madame'],
            ['email' => 'particular3@test.fr', 'firstName' => 'Antoine', 'name' => 'Garnier',  'phone' => '0603030303', 'adress' => '12 rue du Moulin, Bordeaux',    'gender' => 'Monsieur'],
        ];

        $particulars = [];
        foreach ($particularsData as $data) {
            $p = new Particular();
            $p->setEmail($data['email'])
              ->setFirstName($data['firstName'])
              ->setName($data['name'])
              ->setPhone($data['phone'])
              ->setAdress($data['adress'])
              ->setInvoiceAdress($data['adress'])
              ->setGender($data['gender'])
              ->setRoles(['ROLE_CUSTOMER']);
            $p->setPassword($this->passwordHasher->hashPassword($p, 'particular'));
            $manager->persist($p);
            $particulars[] = $p;
        }

        // =========================================================
        // CLIENTS ENTREPRISES
        // =========================================================

        $companiesData = [
            ['email' => 'company@test.fr',  'firstName' => 'Marc',   'name' => 'Leroy',   'phone' => '0701010101', 'adress' => '1 rue Basse, Nantes',        'siret' => '12345678901234', 'companyName' => 'TechCorp SAS'],
            ['email' => 'company2@test.fr', 'firstName' => 'Julie',  'name' => 'Morin',   'phone' => '0702020202', 'adress' => '8 boulevard Haussmann, Paris', 'siret' => '98765432109876', 'companyName' => 'DataSoft SARL'],
            ['email' => 'company3@test.fr', 'firstName' => 'Kevin',  'name' => 'Blanc',   'phone' => '0703030303', 'adress' => '3 rue de la République, Lille','siret' => '11223344556677', 'companyName' => 'CloudNet SA'],
        ];

        $companies = [];
        foreach ($companiesData as $data) {
            $c = new Company();
            $c->setEmail($data['email'])
              ->setFirstName($data['firstName'])
              ->setName($data['name'])
              ->setPhone($data['phone'])
              ->setAdress($data['adress'])
              ->setInvoiceAdress($data['adress'])
              ->setSiret($data['siret'])
              ->setCompanyName($data['companyName'])
              ->setRoles(['ROLE_CUSTOMER']);
            $c->setPassword($this->passwordHasher->hashPassword($c, 'company'));
            $manager->persist($c);
            $companies[] = $c;
        }

        // =========================================================
        // OFFRES (avec versioning)
        // =========================================================

        $offersData = [
            ['Offre de base',     1,  100],
            ['Offre Start-Up',   10,  900],
            ['Offre PME',        21, 1680],
            ['Offre Entreprise', 42, 2940],
        ];

        $activeOffers = [];
        foreach ($offersData as $index => [$offerName, $nbUnit, $price]) {
            $offer = new Offer();
            $offer->setName($offerName)
                  ->setNbUnit($nbUnit)
                  ->setPrice($price);
            $manager->persist($offer);
            $activeOffers[] = $offer;
            if ($index === 0) {
                $this->addReference('offer-first', $offer);
            }
        }

        // Simulation d'une offre modifiée — ancienne version inactive
        $oldOffer = new Offer();
        $oldOffer->setName('Offre Start-Up');
        $oldOffer->setNbUnit(10);
        $oldOffer->setPrice(800);
        $oldOffer->setVersion(1);
        $oldOffer->setIsActive(false);
        $oldOffer->setCreatedAt(new \DateTimeImmutable('2025-01-01'));
        $manager->persist($oldOffer);

        // =========================================================
        // BAIES ET UNITÉS (30 baies x 42 unités)
        // =========================================================

        $unitStatuses = [UnitStatus::Available, UnitStatus::Available, UnitStatus::Available, UnitStatus::Unavailable, UnitStatus::Maintenance];

        for ($b = 1; $b <= 30; $b++) {
            $bay = new Bay();
            $bay->setCapacityUnit(42);
            $bay->setName(sprintf('B%03d', $b));
            $manager->persist($bay);

            for ($u = 1; $u <= 42; $u++) {
                $unit = new Unit();
                $unit->setName(sprintf('U%02d', $u))
                     ->setPosition($u)
                     ->setBay($bay)
                     ->setPowerConsumption(rand(100, 500))
                     ->setTemperature(rand(18, 26) + (rand(0, 9) / 10))
                     ->setNetworkThroughput(rand(1, 10))
                     ->setStatus($unitStatuses[array_rand($unitStatuses)]);
                if ($b === 1 && $u === 1) $this->addReference('unit-1-1', $unit);
                if ($b === 1 && $u === 2) $this->addReference('unit-1-2', $unit);
                if ($b === 2 && $u === 1) $this->addReference('unit-2-1', $unit);
                $manager->persist($unit);
            }
        }

        // =========================================================
        // RÉSERVATIONS
        // =========================================================

        $reservationsData = [
            // [customer, offer, beginDate, finishDate, status, unitRef]
            [$particulars[0], $activeOffers[0], '2026-01-01', '2026-02-01', ReservationStatus::Confirmed,  'unit-1-1'],
            [$particulars[1], $activeOffers[1], '2026-02-01', '2026-03-01', ReservationStatus::Confirmed,  'unit-1-2'],
            [$companies[0],   $activeOffers[2], '2026-03-01', '2027-03-01', ReservationStatus::Confirmed,  'unit-2-1'],
            [$companies[1],   $activeOffers[0], '2026-01-15', '2026-02-15', ReservationStatus::Cancelled,  'unit-1-1'],
            [$particulars[2], $activeOffers[3], '2026-04-01', '2027-04-01', ReservationStatus::Pending,    'unit-1-2'],
        ];

        foreach ($reservationsData as [$customer, $offer, $begin, $finish, $status, $unitRef]) {
            $reservation = new Reservation();
            $reservation->setBeginDate(new \DateTimeImmutable($begin))
                        ->setFinishDate(new \DateTimeImmutable($finish))
                        ->setCustomer($customer)
                        ->setOffer($offer)
                        ->setStatus($status)
                        ->addUnit($this->getReference($unitRef, Unit::class));
            $manager->persist($reservation);
        }

        // =========================================================
        // INTERVENTIONS
        // =========================================================

        $interventionsData = [
            ['incident',     'Panne électrique sur le serveur',        '2026-02-10 08:00:00', '2026-02-10 10:00:00', 'unit-1-1'],
            ['maintenance',  'Remplacement disque dur défaillant',      '2026-02-15 09:00:00', '2026-02-15 11:00:00', 'unit-1-2'],
            ['upgrade',      'Mise à jour firmware baie B002',          '2026-03-01 14:00:00', '2026-03-01 16:00:00', 'unit-2-1'],
            ['incident',     'Surchauffe détectée sur unité U01',       '2026-03-10 07:00:00', '2026-03-10 09:30:00', 'unit-1-1'],
        ];

        foreach ($interventionsData as [$type, $desc, $begin, $finish, $unitRef]) {
            $intervention = new Intervention();
            $intervention->setType($type)
                         ->setDescription($desc)
                         ->setBeginDate(new \DateTime($begin))
                         ->setFinishDate(new \DateTime($finish))
                         ->addUnit($this->getReference($unitRef, Unit::class));
            $manager->persist($intervention);
        }

        // =========================================================
        // AVIS (NOTICES)
        // =========================================================

        $noticesData = [
            [$particulars[0], 5, 'Service excellent, infrastructure très fiable. Je recommande vivement !'],
            [$particulars[1], 4, 'Très bon service, équipe réactive. Quelques petites améliorations possibles.'],
            [$companies[0],   3, 'Service correct mais les délais de réponse du support pourraient être améliorés.'],
            [$companies[1],   5, 'Parfait pour nos besoins, aucune interruption depuis 6 mois. Excellent rapport qualité/prix.'],
            [$particulars[2], 2, 'Déçu par la qualité du support lors d\'un incident. Temps de résolution trop long.'],
        ];

        foreach ($noticesData as [$customer, $note, $comment]) {
            $notice = new Notice();
            $notice->setCustomer($customer)
                   ->setNote($note)
                   ->setComment($comment);
            $manager->persist($notice);
        }

        // =========================================================
        // TICKETS
        // =========================================================

        $ticketsData = [
            [$particulars[0], 'Problème de connexion SSH',       'Impossible de me connecter en SSH à mon serveur depuis hier soir.',      TicketStatus::Open,       null],
            [$companies[0],   'Surchauffe unité U05',            'L\'unité U05 de la baie B001 affiche une température anormale.',         TicketStatus::InProgress, $technicians[0]],
            [$particulars[1], 'Facturation incorrecte',          'Ma facture du mois de février ne correspond pas à mon offre souscrite.', TicketStatus::Resolved,   $technicians[1]],
            [$companies[1],   'Demande d\'extension de contrat', 'Nous souhaitons passer de l\'offre Start-Up à l\'offre PME.',            TicketStatus::Open,       null],
            [$companies[2],   'Perte de paquets réseau',         'Nous constatons une perte de paquets importante sur nos unités.',        TicketStatus::InProgress, $technicians[2]],
        ];

        foreach ($ticketsData as [$customer, $subject, $description, $status, $technician]) {
            $ticket = new Ticket();
            $ticket->setSubject($subject)
                   ->setDescription($description)
                   ->setStatus($status)
                   ->setCustomer($customer);

            if ($status === TicketStatus::Resolved) {
                $ticket->setCloseDate(new \DateTime('2026-03-15 10:00:00'));
                $ticket->setAssignedBy($administrator);
            }
            if ($technician !== null) {
                $ticket->addTechnician($technician);
                $ticket->setAssignedBy($administrator);
            }

            $manager->persist($ticket);
        }

        $manager->flush();
    }
}