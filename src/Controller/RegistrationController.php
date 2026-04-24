<?php

declare(strict_types=1);

namespace App\Controller;

use App\Entity\Company;
use App\Entity\Particular;
use App\Form\CompanyRegistrationType;
use App\Form\ParticularRegistrationType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

final class RegistrationController extends AbstractController
{
    #[Route('/registration', name: 'app_registration')]
    public function index(): Response
    {
        return $this->render('registration/index.html.twig', [
            'controller_name' => 'RegistrationController',
        ]);
    }

    #[Route('/registration/particular', name: 'app_particular_registration')]
    public function particularRegistration(Request $request, UserPasswordHasherInterface $passwordHasher, EntityManagerInterface $entityManager): Response
    {
        $particular = new Particular();
        $form = $this->createForm(ParticularRegistrationType::class, $particular);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $particular->setRoles(['ROLE_CUSTOMER']);
            $particular->setPassword(
                $passwordHasher->hashPassword(
                    $particular,
                    $form->get('password')->getData()
                )
            );
            $entityManager->persist($particular);
            $entityManager->flush();

            return $this->redirectToRoute('app_home');
        }

        return $this->render('registration/particular_registration.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/registration/company', name: 'app_company_registration')]
    public function companyRegistration(Request $request, UserPasswordHasherInterface $passwordHasher, EntityManagerInterface $entityManager): Response
    {
        $company = new Company();
        $form = $this->createForm(CompanyRegistrationType::class, $company);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $company->setRoles(['ROLE_CUSTOMER']);
            $company->setPassword(
                $passwordHasher->hashPassword(
                    $company,
                    $form->get('password')->getData()
                )
            );
            $entityManager->persist($company);
            $entityManager->flush();

            return $this->redirectToRoute('app_home');
        }

        return $this->render('registration/company_registration.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
