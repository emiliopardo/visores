<?php

namespace App\Controller\Admin;

use App\Entity\MapeaCore;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaCoreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaCore::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
