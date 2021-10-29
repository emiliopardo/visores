<?php

namespace App\Controller\Admin;

use App\Entity\MapeaCore;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\UrlField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaCoreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaCore::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->add(Crud::PAGE_INDEX, Action::DETAIL)
        ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            // the labels used to refer to this entity in titles, buttons, etc.
            ->setEntityLabelInSingular('Mapea Core')
            ->setEntityLabelInPlural('Mapea Cores')
            ->showEntityActionsAsDropdown(false)
            // the Symfony Security permission needed to manage the entity
            // (none by default, so you can manage all instances of the entity)
            // ->setEntityPermission('ROLE_EDITOR')
        ;
    }    
  
    public function configureFields(string $pageName): iterable
    {
        return [
            // IdField::new('id'),
            TextField::new('name')->setHelp('Nombre corto'),
            TextField::new('description')->setHelp('Descripción'),
            UrlField::new('javascript')->setHelp('Url del fichero javascript'),
            UrlField::new('styles')->setHelp('Url del fichero de estilos'),
            UrlField::new('configuration')->setHelp('Url del fichero de configuración'),
        ];
    } 
}
