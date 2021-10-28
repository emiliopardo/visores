<?php

namespace App\Controller\Admin;

use App\Entity\MapeaControl;
use App\Entity\MapeaControlConfig;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CodeEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaControlCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaControl::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            // the labels used to refer to this entity in titles, buttons, etc.
            ->setEntityLabelInSingular('Mapea Control')
            ->setEntityLabelInPlural('Mapea Controles')
            // the Symfony Security permission needed to manage the entity
            // (none by default, so you can manage all instances of the entity)
            // ->setEntityPermission('ROLE_EDITOR')
        ;
    }  

    public function configureFields(string $pageName): iterable
    {
        return [
            //IdField::new('id'),
            TextField::new('name'),
            CodeEditorField::new('constructor')->setLanguage('js')->setHelp('Parámetros de configuración'),
            //ArrayField::new('mapeaControlConfigs'),
            AssociationField::new('mapeaControlConfigs')->setFormTypeOptions([
                'by_reference' => true,
                'multiple' => true,
            ])
        ];
    }

}
