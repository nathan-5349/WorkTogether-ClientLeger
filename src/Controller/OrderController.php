<?php

declare(strict_types=1);

namespace App\Controller;

use App\Entity\Customer;
use App\Entity\Reservation;
use App\Enum\UnitStatus;
use App\Form\OrderType;
use App\Repository\OfferRepository;
use App\Repository\ReservationRepository;
use App\Repository\UnitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class OrderController extends AbstractController
{
    #[Route('/order/{id}', name: 'app_order')]
    public function index(int $id, Request $request, EntityManagerInterface $em, OfferRepository $offerRepo,
        UnitRepository $unitRepository): Response
    {
        $offer = $offerRepo->find($id);

        if (!$offer) {
            throw $this->createNotFoundException('Offre introuvable');
        }

        $reservation = new Reservation();
        $form = $this->createForm(OrderType::class, $reservation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $beginDate = $form->get('beginDate')->getData();

            if ($beginDate < new \DateTimeImmutable()) {
                $this->addFlash('error', 'La date de début ne peut pas être dans le passé.');

                return $this->redirectToRoute('app_order', ['id' => $id]);
            }

            $duration = $form->get('duration')->getData();
            if ('monthly' === $duration) {
                $reservation->setFinishDate((clone $beginDate)->modify('+1 month'));
            } elseif ('annual' === $duration) {
                $reservation->setFinishDate((clone $beginDate)->modify('+1 year'));
            }

            $reservation->setOffer($offer);
            $customer = $this->getUser();
            if (!$customer instanceof Customer) {
                throw $this->createAccessDeniedException('Vous devez être un client pour commander.');
            }
            $reservation->setCustomer($customer);
            $reservation->setBeginDate($beginDate);

            $units = $unitRepository->findAvailableUnits($offer->getNbUnit());
            foreach ($units as $unit) {
                $reservation->addUnit($unit);
                $unit->setStatus(UnitStatus::Unavailable);
            }

            $em->persist($reservation);
            $em->flush();

            return $this->redirectToRoute('app_order_success', ['id' => $reservation->getId()]);
        }

        return $this->render('order/index.html.twig', [
            'form' => $form->createView(),
            'offer' => $offer,
        ]);
    }

    #[Route('/order/success/{id}', name: 'app_order_success')]
    public function success(int $id, ReservationRepository $reservationRepository): Response
    {
        $reservation = $reservationRepository->find($id);

        if (!$reservation) {
            throw $this->createNotFoundException('Réservation introuvable');
        }

        return $this->render('order/success.html.twig', [
            'reservation' => $reservation,
        ]);
    }
}
