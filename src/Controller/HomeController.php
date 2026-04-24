<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    /*
    #[Route('/accueil', name: 'app_home')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
    */

    #[Route('/', name: 'app_root')]
    public function redirectByLanguage(Request $request): Response
    {
        $locale = $request->getLocale();
        return $this->redirectToRoute('app_home', ['_locale' => $locale]);
    }

    #[Route('/{_locale}/accueil', name: 'app_home', requirements: ['_locale' => 'fr|en|es'])]
    public function index(): Response
    {
        return $this->render('home/index.html.twig');
    }
}
