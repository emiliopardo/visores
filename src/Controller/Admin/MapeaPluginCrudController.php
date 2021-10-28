<?php

namespace App\Controller\Admin;

use App\Entity\MapeaPlugin;
use App\Entity\MapeaPluginConfig;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
// use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\UrlField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CodeEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaPluginCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaPlugin::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            // the labels used to refer to this entity in titles, buttons, etc.
            ->setEntityLabelInSingular('Mapea Plugin')
            ->setEntityLabelInPlural('Mapea Plugins')
            // the Symfony Security permission needed to manage the entity
            // (none by default, so you can manage all instances of the entity)
            // ->setEntityPermission('ROLE_EDITOR')
        ;
    }     

    
    public function configureFields(string $pageName): iterable
    {
        return [
            //IdField::new('id'),
            TextField::new('name')->setHelp('Nombre del plugin'),
            CodeEditorField::new('constructor')->setLanguage('js')->setHelp('Constructor del Plugin'),
            UrlField::new('javascript')->setHelp('Url del fichero javascript'),
            UrlField::new('styles')->setHelp('Url del fichero de estilos'),
            AssociationField::new('mapeaPluginConfigs')->setFormTypeOptions([
                'by_reference' => true,
                'multiple' => true,
            ])
        ];
    }
    
}
