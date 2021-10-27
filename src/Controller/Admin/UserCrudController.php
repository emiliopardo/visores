<?php

namespace App\Controller\Admin;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityUpdatedEvent;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserCrudController extends AbstractCrudController implements EventSubscriberInterface
{

    /** @var UserPasswordHasherInterface */
      private $passwordHasher;

     public function __construct(UserPasswordHasherInterface $passwordHasher)
     {
         $this->passwordHasher = $passwordHasher;
     }

    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            // IdField::new('id'),
            TextField::new('username'),
            EmailField::new('email'),
            TextField::new('password')->setFormType(PasswordType::class),
            ArrayField::new('roles'),
        ];
    }

    public static function getSubscribedEvents()
    {
        return [
            BeforeEntityPersistedEvent::class => 'hashPassword',
            BeforeEntityUpdatedEvent::class => 'hashPassword',
        ];
    }

        /** @internal */
        public function hashPassword($event)
        {
            $user = $event->getEntityInstance();
            if ($user instanceof User && $user->getPassword()) {
                $user->setPassword($this->passwordHasher->hashPassword($user, $user->getPassword()));
            }
        }

}

