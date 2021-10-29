<?php

namespace App\Controller\Admin;

use App\Entity\MapeaLayerWMS;
use App\Entity\Legend;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\UrlField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaLayerWMSCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaLayerWMS::class;
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
            ->setEntityLabelInSingular('Mapea Layer WMS')
            ->setEntityLabelInPlural('Mapea Layers WMS ')
            ->showEntityActionsAsDropdown(false)
            // the Symfony Security permission needed to manage the entity
            // (none by default, so you can manage all instances of the entity)
            // ->setEntityPermission('ROLE_EDITOR')
        ;
    }      

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name'),
            TextField::new('description'),
            TextField::new('layerName'),
            TextField::new('layerLegend'),
            UrlField::new('layerUrl'),
            BooleanField::new('layerTransparent'),
            BooleanField::new('layerTiled'),
            TextField::new('layerStyle')->setFormTypeOptions([
                //'required'=> false,
                'data'=>'default',
            ]),
            AssociationField::new('layerLegendImage')->setFormTypeOptions([
                'by_reference' => true,
                'multiple' => false,
            ])
        ];
    }
}
