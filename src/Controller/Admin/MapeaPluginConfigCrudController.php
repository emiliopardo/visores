<?php

namespace App\Controller\Admin;

use App\Entity\MapeaPlugin;
use App\Entity\MapeaPluginConfig;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CodeEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaPluginConfigCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaPluginConfig::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            // the labels used to refer to this entity in titles, buttons, etc.
            ->setEntityLabelInSingular('Configuración Mapea Plugin')
            ->setEntityLabelInPlural('Configuraciones Mapea Plugin')
            // the Symfony Security permission needed to manage the entity
            // (none by default, so you can manage all instances of the entity)
            // ->setEntityPermission('ROLE_EDITOR')
        ;
    }      

    public function configureFields(string $pageName): iterable
    {
        return [
            //IdField::new('id'),
            AssociationField::new('mapeaPlugin')->setHelp('Mapea Plugin asociado'),   
            TextField::new('description')->setHelp('Descripción de la configuración'),
            CodeEditorField::new('config')->setLanguage('js')->setHelp('Parámetros de configuración')
        ];
    }
}
