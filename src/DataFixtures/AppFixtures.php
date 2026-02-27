<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\Administrator;

class AppFixtures extends Fixture
{
    public function __construct(private UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        $admiinistrator = new Administrator();
        $admiinistrator->setEmail('admin@test.fr');
        $admiinistrator->setFirstName('Admin');
        $admiinistrator->setName('Admin');
        $admiinistrator->setRoles(['ROLE_ADMIN']);
        $admiinistrator->setPassword($this->passwordHasher->hashPassword($admiinistrator, 'admin'));

        $manager->persist($admiinistrator);
        $manager->flush();
    }
}
