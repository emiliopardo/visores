<?php

namespace App\Controller\Admin;

use App\Entity\MapeaControl;
use App\Entity\MapeaControlConfig;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CodeEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaControlConfigCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaControlConfig::class;
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
            ->setEntityLabelInSingular('Configuración Mapea Control')
            ->setEntityLabelInPlural('Configuraciones Mapea Control')
            ->showEntityActionsAsDropdown(false)
            // the Symfony Security permission needed to manage the entity
            // (none by default, so you can manage all instances of the entity)
            // ->setEntityPermission('ROLE_EDITOR')
        ;
    }  


    public function configureFields(string $pageName): iterable
    {
        return [
            //IdField::new('id'),
            AssociationField::new('mapeaControl')->setHelp('Mapea Control asociado'),   
            TextField::new('name')->setHelp('nombre de la configuración')->hideOnIndex(),
            TextField::new('description')->setHelp('Descripción de la configuración'),
            CodeEditorField::new('config')->setLanguage('js')->setHelp('Parámetros de configuración')
        ];
    }

}
