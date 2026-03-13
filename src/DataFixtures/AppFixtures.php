<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\Administrator;
use App\Entity\Customer;
use App\Entity\Technician;
use App\Entity\Support;
use App\Entity\Accountant;
use App\Entity\User;
use App\Entity\Company;
use App\Entity\Particular;
use App\Entity\Offer;
use App\Entity\Bay;
use App\Entity\Unit;
use App\Entity\Intervention;
use App\Enum\ReservationStatus;
use App\Entity\Reservation;

class AppFixtures extends Fixture
{
    public function __construct(private UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        // --- Création de l'administrateur ---
        $administrator = new Administrator();
        $administrator->setEmail('admin@test.fr') 
                      ->setFirstName('Admin')
                      ->setName('Admin')
                      ->setRoles(['ROLE_ADMIN']);
        $administrator->setPassword($this->passwordHasher->hashPassword($administrator, 'admin'));

        // --- Création des clients (particulier et entreprise) ---
        $particular = new Particular();
        $particular->setEmail('particular@test.fr');
        $particular->setFirstName('Particular');
        $particular->setName('Particular');
        $particular->setAdress('1 rue de la paix');
        $particular->setInvoiceAdress('1 rue de la paix');
        $particular->setPhone('0123456789');
        $particular->setGender("Monsieur");  
        $particular->setRoles(['ROLE_CUSTOMER']);
        $particular->setPassword($this->passwordHasher->hashPassword($particular, 'particular'));

        $company = new Company();
        $company->setEmail('company@test.fr')
                ->setFirstName('Company')
                ->setName('Company')
                ->setCompanyName('Company')
                ->setAdress('1 rue basse')
                ->setInvoiceAdress('1 rue basse')
                ->setPhone('0987654321')
                ->setSiret('12345678901234')
                ->setRoles(['ROLE_CUSTOMER']);
        $company->setPassword($this->passwordHasher->hashPassword($company, 'company'));


        // --- Création des membres du staff (comptable et support) ---
        // Pour ajouter un membre du staff, il suffit de l'ajouter dans le tableau $staffData avec sa classe, son email, son rôle et son nom
        $staffData = [
            ['class' => Accountant::class, 'email' => 'accountant@test.fr', 'role' => 'ROLE_ACCOUNTANT', 'name' => 'Comptable'],
            ['class' => Support::class, 'email' => 'support@test.fr', 'role' => 'ROLE_SUPPORT', 'name' => 'Support'],
        ];

        foreach ($staffData as $data) {
            $member = new $data['class']();
            $member->setEmail($data['email'])
                   ->setFirstName('Staff')
                   ->setName($data['name'])
                   ->setRoles([$data['role']]);
            $member->setPassword($this->passwordHasher->hashPassword($member, 'staff123'));
            $manager->persist($member);
        }

        // --- Création d'un technicien ---
        $technician = new Technician();
        $technician->setEmail('technician@test.fr');
        $technician->setFirstName('Technician');
        $technician->setName('Technician');
        $technician->setPhone('0123456789');
        $technician->setLevel(1);
        $technician->setRoles(['ROLE_TECHNICIAN']);
        $technician->setPassword($this->passwordHasher->hashPassword($technician, 'technician'));

        // --- Création des offres ---
        // Pour ajouter une offre, il suffit de l'ajouter dans le tableau $offers avec son nom, le nombre d'unités et le prix total
        $offers = [
            ['Offre de base', 1, 100],
            ['Offre Start-Up', 10, 900],
            ['Offre PME', 21, 1680],
            ['Offre Entreprise', 42, 2940],
        ];

        $firstOffer = null;
        foreach ($offers as $index => [$offerName, $nbUnit, $price]) {
            $offer = new Offer();
            $offer->setName($offerName)
                  ->setNbUnit($nbUnit)
                  ->setPrice($price);
            $manager->persist($offer);
            if ($index === 0) {
                $this->addReference('offer-first', $offer);
            }
        }

        // --- Création des baies et des unités ---
        for ($b = 1; $b <= 30; $b++) {
            $bay = new Bay();
            $bay->setCapacityUnit(42);
            $bay->setName(sprintf('B%03d', $b)); 
            $manager->persist($bay);

        for ($u = 1; $u <= 42; $u++) {
            // On ajoute une référence à la première unité de la première baie pour pouvoir l'utiliser dans les tests fonctionnels
            $unit = new Unit();
            $unit->setName(sprintf('U%02d', $u)); 
            $unit->setPosition($u);
            $unit->setBay($bay);
            $unit->setPowerConsumption(rand(100, 500));
            $unit->setTemperature(rand(18, 26) + (rand(0, 9) / 10));
            $unit->setNetworkThroughput(rand(1, 10));
            if ($b === 1 && $u === 1) {
                $this->addReference('unit-first', $unit);
            }
            $manager->persist($unit);
            }
        }

        $reservation = new Reservation();
        $reservation->setBeginDate(new \DateTimeImmutable('2026-03-01'));
        $reservation->setFinishDate(new \DateTimeImmutable('2026-04-01'));
        $reservation->setOffer($this->getReference('offer-first', Offer::class));
        $reservation->setCustomer($particular);
        $reservation->addUnit($this->getReference('unit-first', Unit::class));

        // --- Création des interventions ---

        $intervention = new Intervention();
        $intervention->setType('incident');
        $intervention->setDescription('Panne électrique sur le serveur');
        $intervention->setBeginDate(new \DateTime('2026-03-01 08:00:00'));
        $intervention->setFinishDate(new \DateTime('2026-03-01 10:00:00'));
        $intervention->addUnit($this->getReference('unit-first', Unit::class));
        
        // --- Persistance des utilisateurs ---
        $manager->persist($administrator);
        $manager->persist($particular);
        $manager->persist($company);
        $manager->persist($technician);
        $manager->persist($reservation);
        $manager->persist($intervention);
        $manager->flush();
    }
}
