<?php

namespace App\Repository;

use App\Entity\Legend;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Legend|null find($id, $lockMode = null, $lockVersion = null)
 * @method Legend|null findOneBy(array $criteria, array $orderBy = null)
 * @method Legend[]    findAll()
 * @method Legend[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LegendRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Legend::class);
    }

    // /**
    //  * @return Legend[] Returns an array of Legend objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('l.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Legend
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
