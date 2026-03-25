<?php

namespace App\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputInterface;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\DBAL\Types\Types;

#[AsCommand(name: 'feedback')]
class SendMailFeedback
{
    private EntityManagerInterface $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    public function __invoke(InputInterface $input, OutputInterface $output): int
    {
        $output->writeln('Envoi du mail suivant :');
        $output->writeln('Bonjour,');
        $output->writeln('Vous avez commandé une offre il y a un mois chez nous (W2T).');
        $output->writeln('Laissez-nous votre avis sur le lien suivant.');

        $limitDate = new \DateTime('-1 month');

        $qb = $this->em->createQueryBuilder();

        $qb->select('m')
            ->from('App\Entity\Reservation', 'm')
            ->where('m.beginDate <= :limitDate')
            ->setParameter('limitDate', $limitDate);

        $results = $qb->getQuery()->getResult();

        foreach ($results as $result) {
            $output->writeln('Mail envoyé à : ' . $result->getCustomer()->getEmail());
        }

        return Command::SUCCESS;
    }
}