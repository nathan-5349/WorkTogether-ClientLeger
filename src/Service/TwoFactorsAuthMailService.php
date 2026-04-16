<?php

namespace App\Service;

use App\Entity\User;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Doctrine\ORM\EntityManagerInterface;

class TwoFactorsAuthMailService
{
    public function __construct(
        private MailerInterface $mailer,
        private EntityManagerInterface $em
    ){}

    public function sendTwoFactorsAuthCode(User $user): void
    {
        $code = (string) random_int(100000, 999999);
        $user->setTwoFactorAuth($code);
        $user->setTwoFactorAuthExpiresAt(new \DateTimeImmutable('+10 minutes'));
        $this->em->flush();

        $email = (new Email())
            ->from('noreply@worktogether.fr')
            ->to($user->getEmail())
            ->subject('Votre code de vérification à deux facteurs')
            ->text("Votre code de vérification à deux facteurs est : $code. Il expire dans 10 minutes.");

        $this->mailer->send($email);
    }
}
