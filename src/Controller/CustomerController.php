<?php

declare(strict_types=1);

namespace App\Controller;

use App\Entity\Customer;
use App\Form\ChangePasswordType;
use App\Form\CompanyRegistrationType;
use App\Form\ParticularRegistrationType;
use App\Form\UnitType;
use App\Repository\ReservationRepository;
use App\Repository\UnitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

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

    #[Route('/order/reservations', name: 'app_order_reservations')]
    public function reservations(ReservationRepository $reservationRepository): Response
    {
        $customer = $this->getUser();
        if (!$customer instanceof Customer) {
            throw $this->createAccessDeniedException('Vous devez être un client pour voir vos réservations.');
        }

        $reservations = $reservationRepository->findBy(['customer' => $customer]);

        return $this->render('order/reservations.html.twig', [
            'reservations' => $reservations,
        ]);
    }

    #[Route('/customer/unit/{id}', name: 'app_customer_unit_detail')]
    public function unitDetail(int $id, Request $request, EntityManagerInterface $em, UnitRepository $unitRepository): Response
    {
        $unit = $unitRepository->find($id);

        if (!$unit) {
            throw $this->createNotFoundException('Unité introuvable.');
        }

        $form = $this->createForm(UnitType::class, $unit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();

            return $this->redirectToRoute('app_customer_unit_detail', ['id' => $unit->getId()]);
        }

        return $this->render('customer/unit.html.twig', [
            'unit' => $unit,
            'form' => $form->createView(),
        ]);
    }
}
