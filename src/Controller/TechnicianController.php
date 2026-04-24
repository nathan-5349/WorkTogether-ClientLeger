<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class TechnicianController extends AbstractController
{
    #[Route('/technician/dashboard', name: 'app_technician_dashboard')]
    public function index(): Response
    {
        return $this->render('technician/index.html.twig', [
            'controller_name' => 'TechnicianController',
        ]);
    }
}
