<?php

namespace App\Repository;

use App\Entity\MapeaLayerGeojson;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MapeaLayerGeojson|null find($id, $lockMode = null, $lockVersion = null)
 * @method MapeaLayerGeojson|null findOneBy(array $criteria, array $orderBy = null)
 * @method MapeaLayerGeojson[]    findAll()
 * @method MapeaLayerGeojson[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MapeaLayerGeojsonRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MapeaLayerGeojson::class);
    }

    // /**
    //  * @return MapeaLayerGeojson[] Returns an array of MapeaLayerGeojson objects
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
    public function findOneBySomeField($value): ?MapeaLayerGeojson
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
