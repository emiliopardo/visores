<?php

namespace App\Repository;

use App\Entity\MapeaPluginConfig;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MapeaPluginConfig|null find($id, $lockMode = null, $lockVersion = null)
 * @method MapeaPluginConfig|null findOneBy(array $criteria, array $orderBy = null)
 * @method MapeaPluginConfig[]    findAll()
 * @method MapeaPluginConfig[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MapeaPluginConfigRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MapeaPluginConfig::class);
    }

    // /**
    //  * @return MapeaPluginConfig[] Returns an array of MapeaPluginConfig objects
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
    public function findOneBySomeField($value): ?MapeaPluginConfig
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
