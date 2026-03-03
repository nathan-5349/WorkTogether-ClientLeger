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

class AppFixtures extends Fixture
{
    public function __construct(private UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        $administrator = new Administrator();
        $administrator->setEmail('admin@test.fr');
        $administrator->setFirstName('Admin');
        $administrator->setName('Admin');
        $administrator->setRoles(['ROLE_ADMIN']);
        $administrator->setPassword($this->passwordHasher->hashPassword($administrator, 'admin'));

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
        $company->setEmail('company@test.fr');
        $company->setFirstName('Company');
        $company->setName('Company');
        $company->setCompanyName('Company');
        $company->setAdress('1 rue basse');
        $company->setInvoiceAdress('1 rue basse');
        $company->setPhone('0987654321');
        $company->setSiret('12345678901234');
        $company->setRoles(['ROLE_CUSTOMER']);
        $company->setPassword($this->passwordHasher->hashPassword($company, 'company'));

        $accountant = new Accountant();
        $accountant->setEmail('accountant@test.fr');
        $accountant->setFirstName('Accountant');
        $accountant->setName('Accountant');
        $accountant->setRoles(['ROLE_ACCOUNTANT']);
        $accountant->setPassword($this->passwordHasher->hashPassword($accountant, 'accountant'));

        $support = new Support();
        $support->setEmail('support@test.fr');
        $support->setFirstName('Support');
        $support->setName('Support');
        $support->setRoles(['ROLE_SUPPORT']);
        $support->setPassword($this->passwordHasher->hashPassword($support, 'support'));

        $technician = new Technician();
        $technician->setEmail('technician@test.fr');
        $technician->setFirstName('Technician');
        $technician->setName('Technician');
        $technician->setPhone('0123456789');
        $technician->setLevel(1);
        $technician->setRoles(['ROLE_TECHNICIAN']);
        $technician->setPassword($this->passwordHasher->hashPassword($technician, 'technician'));

        $manager->persist($administrator);
        $manager->persist($particular);
        $manager->persist($company);
        $manager->persist($accountant);
        $manager->persist($support);
        $manager->persist($technician);
        $manager->flush();
    }
}
