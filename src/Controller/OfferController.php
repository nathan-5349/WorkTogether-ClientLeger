<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\OfferRepository;

final class OfferController extends AbstractController
{
    #[Route('/all_offers', name: 'app_all_offers')]
    public function allOffer(OfferRepository $offerRepository): Response
    {
        return $this->render('offer/index.html.twig', [
            'controller_name' => 'OfferController',
            'offers' => $offerRepository->findAll(),
        ]);
    }

    #[Route('/offers', name: 'app_offers')]
    public function index(OfferRepository $offerRepository): Response
    {
        return $this->render('offer/index.html.twig', [
            'offers' => $offerRepository->findActiveOffers(),
        ]);
    }
}
