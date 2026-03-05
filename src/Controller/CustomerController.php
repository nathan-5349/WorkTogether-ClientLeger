<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Form\ParticularRegistrationType;
use App\Form\CompanyRegistrationType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\ChangePasswordType;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

final class CustomerController extends AbstractController
{
    #[Route('/customer/dashboard', name: 'app_customer_dashboard')]
    public function index(): Response
    {
        return $this->render('customer/dashboard.html.twig', [
            'controller_name' => 'CustomerController',
        ]);
    }
    
    #[Route('/customer/profile', name: 'app_customer_profile')]
    public function profile(): Response
    {
        $user = $this->getUser();

        return $this->render('customer/profile.html.twig', [
            'user' => $user,
        ]);
    }

    #[Route('/customer/edit', name: 'app_customer_edit')]
    public function edit(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();

        if ($user->isParticular()) {
            $form = $this->createForm(ParticularRegistrationType::class, $user, ['is_edit' => true]);
        } else {
            $form = $this->createForm(CompanyRegistrationType::class, $user, ['is_edit' => true]);
        }

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();

            return $this->redirectToRoute('app_customer_profile');
        }

        return $this->render('customer/edit.html.twig', [
            'form' => $form->createView(),
            'user' => $user,
        ]);
    }

    #[Route('/customer/change-password', name: 'app_customer_change_password')]
    public function changePassword(Request $request, EntityManagerInterface $em, UserPasswordHasherInterface $passwordHasher): Response
    {
        $user = $this->getUser();
        
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        $form = $this->createForm(ChangePasswordType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $currentPassword = $form->get('currentPassword')->getData();

            if (!$passwordHasher->isPasswordValid($user, $currentPassword)) {
                $this->addFlash('error', 'Mot de passe actuel incorrect.');
                return $this->redirectToRoute('app_customer_change_password');
            }

            $user->setPassword(
                $passwordHasher->hashPassword(
                    $user,
                    $form->get('password')->getData()
                )
            );
            
            $em->flush();

            return $this->redirectToRoute('app_customer_profile');
        }

        return $this->render('customer/change_password.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
