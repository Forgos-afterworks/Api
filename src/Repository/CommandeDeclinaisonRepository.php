<?php

namespace App\Repository;

use App\Entity\CommandeDeclinaison;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CommandeDeclinaison|null find($id, $lockMode = null, $lockVersion = null)
 * @method CommandeDeclinaison|null findOneBy(array $criteria, array $orderBy = null)
 * @method CommandeDeclinaison[]    findAll()
 * @method CommandeDeclinaison[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommandeDeclinaisonRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CommandeDeclinaison::class);
    }

    // /**
    //  * @return CommandeDeclinaison[] Returns an array of CommandeDeclinaison objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?CommandeDeclinaison
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
