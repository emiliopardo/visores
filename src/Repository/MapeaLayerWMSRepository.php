<?php

namespace App\Repository;

use App\Entity\MapeaLayerWMS;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MapeaLayerWMS|null find($id, $lockMode = null, $lockVersion = null)
 * @method MapeaLayerWMS|null findOneBy(array $criteria, array $orderBy = null)
 * @method MapeaLayerWMS[]    findAll()
 * @method MapeaLayerWMS[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MapeaLayerWMSRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MapeaLayerWMS::class);
    }

    // /**
    //  * @return MapeaLayerWMS[] Returns an array of MapeaLayerWMS objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('m')
            ->andWhere('m.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('m.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?MapeaLayerWMS
    {
        return $this->createQueryBuilder('m')
            ->andWhere('m.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
