<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SupportController extends AbstractController
{
    #[Route('/support/dashboard', name: 'app_support_dashboard')]
    public function index(): Response
    {
        return $this->render('support/index.html.twig', [
            'controller_name' => 'SupportController',
        ]);
    }
}
