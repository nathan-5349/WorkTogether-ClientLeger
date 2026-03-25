<?php

namespace App\Repository;

use App\Entity\Unit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Enum\UnitStatus;

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
/*
    public function findUnitsInSameBay(int $nbUnits): array
{
    // 1. On récupère toutes les baies
    $bays = $this->_em->getRepository(Bay::class)->findAll();

    foreach ($bays as $bay) {
        // 2. On cherche les unités disponibles dans CETTE baie précise
        $units = $this->createQueryBuilder('u')
            ->where('u.bay = :bay')
            ->andWhere('u.status = :status')
            ->setParameter('bay', $bay)
            ->setParameter('status', UnitStatus::Available)
            ->setMaxResults($nbUnits)
            ->getQuery()
            ->getResult();

        // 3. Si on en a assez dans cette baie, on les retourne
        if (count($units) >= $nbUnits) {
            return $units;
        }
    }

    // Si aucune baie n'a assez de place d'un seul bloc
    return []; 
}*/
}
