<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class DashboardController extends AbstractController
{
    #[Route('/dashboard', name: 'app_dashboard')]
    public function index(): Response
    {
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->redirectToRoute('app_admin_dashboard');
        }
        else if ($this->isGranted('ROLE_ACCOUNTANT')) {
            return $this->redirectToRoute('app_accountant_dashboard');
        }
        else if ($this->isGranted('ROLE_SUPPORT')) {
            return $this->redirectToRoute('app_support_dashboard');
        }
        else if ($this->isGranted('ROLE_TECHNICIAN')) {
            return $this->redirectToRoute('app_technician_dashboard');
        }
        else if ($this->isGranted('ROLE_CUSTOMER')) {
            return $this->redirectToRoute('app_customer_dashboard');
        }
        else {
            return $this->redirectToRoute('app_login');
        }
    }
}
