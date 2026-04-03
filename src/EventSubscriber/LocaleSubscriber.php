<?php

namespace App\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\RequestEvent;
use Symfony\Component\HttpKernel\KernelEvents;
class LocaleSubscriber implements EventSubscriberInterface
{
    public function __construct(private string $defaultLocale = 'fr') {}

    public function onKernelRequest(RequestEvent $event): void
    {
        $request = $event->getRequest();

        if ($locale = $request->attributes->get('_locale')) {
            $request->getSession()->set('_locale', $locale);
            return;
        }

        $savedLocale = $request->hasSession() ? $request->getSession()->get('_locale') : null;

        if ($savedLocale) {
            $locale = $savedLocale;
        } else {
            $locale = $request->getPreferredLanguage(['fr', 'en', 'es']);
        }

        $request->setLocale($locale);
    }

    public static function getSubscribedEvents(): array
    {
        return [
            KernelEvents::REQUEST => [['onKernelRequest', 20]],
        ];
    }
}
