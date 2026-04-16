<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class TwoFactorController extends AbstractController
{
    #[Route('/2fa', name: 'app_2fa')]
    public function check(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();

        if (!$user instanceof User) {
            return $this->redirectToRoute('app_login');
        }

        if ($request->isMethod('POST')) {
            $code = $request->request->get('code');

            if ($user->isValidTwoFactorAuth($code)) {
                $user->setTwoFactorAuth(null);
                $user->setTwoFactorAuthExpiresAt(null);
                $em->flush();

                $request->getSession()->set('2fa_verified', true);
                return $this->redirectToRoute('app_dashboard');
            }

            $this->addFlash('error', 'Code invalide ou expiré.');
        }

        return $this->render('security/2fa.html.twig');
    }
}
