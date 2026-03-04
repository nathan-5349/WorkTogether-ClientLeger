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
        $particular->setGender("M");  
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

        foreach ($offers as [$offerName, $nbUnit, $price]) {
            $offer = new Offer();
            $offer->setName($offerName)
                  ->setNbUnit($nbUnit)
                  ->setPrice($price);
            $manager->persist($offer);
        }

        // --- Persistance des utilisateurs ---
        $manager->persist($administrator);
        $manager->persist($particular);
        $manager->persist($company);
        $manager->persist($technician);
        $manager->flush();
    }
}
