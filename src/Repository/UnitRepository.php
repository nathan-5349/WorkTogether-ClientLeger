<?php

declare(strict_types=1);

namespace App\Repository;

use App\Entity\Unit;
use App\Enum\UnitStatus;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Unit>
 */
class UnitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Unit::class);
    }

    //    /**
    //     * @return Unit[] Returns an array of Unit objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('u.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Unit
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    public function findAvailableUnits(int $nbUnits): array
    {
        $qb = $this->createQueryBuilder('u')
            ->leftJoin('u.reservations', 'r')
            ->where('r.id IS NULL OR r.finishDate < :now')
            ->setParameter('now', new \DateTimeImmutable())
            ->andWhere('u.status = :status')
            ->setParameter('status', UnitStatus::Available)
            ->setMaxResults($nbUnits);

        return $qb->getQuery()->getResult();
    }
}
