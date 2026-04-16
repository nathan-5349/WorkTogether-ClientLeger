<?php

namespace App\EventSubscriber;

use App\Entity\User;
use App\Service\TwoFactorsAuthMailService;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;
use Symfony\Component\Security\Http\SecurityEvents;

class TwoFactorSubscriber implements EventSubscriberInterface
{
    public function __construct(
        private TwoFactorsAuthMailService $tfService
    ) {}

    public static function getSubscribedEvents(): array
    {
        return [
            SecurityEvents::INTERACTIVE_LOGIN => 'onInteractiveLogin',
        ];
    }

    public function onInteractiveLogin(InteractiveLoginEvent $event): void
    {
        $user = $event->getAuthenticationToken()->getUser();

        if (!$user instanceof User) {
            return;
        }

        $this->tfService->sendTwoFactorsAuthCode($user);
    }
}
