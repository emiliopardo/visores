<?php

namespace App\Repository;

use App\Entity\MapeaCore;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MapeaCore|null find($id, $lockMode = null, $lockVersion = null)
 * @method MapeaCore|null findOneBy(array $criteria, array $orderBy = null)
 * @method MapeaCore[]    findAll()
 * @method MapeaCore[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MapeaCoreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MapeaCore::class);
    }

    // /**
    //  * @return MapeaCore[] Returns an array of MapeaCore objects
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
    public function findOneBySomeField($value): ?MapeaCore
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
