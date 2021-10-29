<?php

namespace App\Controller\Admin;

use App\Entity\MapeaPlugin;
use App\Entity\MapeaPluginConfig;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
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
            ->setEntityLabelInSingular('Mapea Plugin')
            ->setEntityLabelInPlural('Mapea Plugins')
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
            TextField::new('name')->setHelp('Nombre del plugin'),
            CodeEditorField::new('constructor')->setLanguage('js')->setHelp('Constructor del Plugin'),
            UrlField::new('javascript')->setHelp('Url del fichero javascript')->hideOnIndex(),
            UrlField::new('styles')->setHelp('Url del fichero de estilos')->hideOnIndex(),
            BooleanField::new('needConfig')->setHelp('Plugin con confguración'),
            AssociationField::new('mapeaPluginConfigs')->setFormTypeOptions([
                'by_reference' => true,
                'multiple' => true,
            ])->hideOnIndex(),
        ];
    }
    
}
