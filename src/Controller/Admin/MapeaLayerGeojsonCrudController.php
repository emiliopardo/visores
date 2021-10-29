<?php

namespace App\Controller\Admin;

use App\Entity\MapeaLayerGeojson;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\UrlField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CodeEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MapeaLayerGeojsonCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return MapeaLayerGeojson::class;
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
            ->setEntityLabelInSingular('Mapea Layer Geojson')
            ->setEntityLabelInPlural('Mapea Layers Geojson')
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
            TextField::new('name')->setHelp('nombre descriptivo'),
            TextField::new('description')->setHelp('Descripción del layer'),
            TextField::new('layerName')->setHelp('nombre del layer')->hideOnIndex(),
            UrlField::new('layerUrl')->setHelp('Url del layer')->hideOnIndex(),
            BooleanField::new('extract')->setHelp('Información')->hideOnIndex(),
            CodeEditorField::new('layerStyle')->setLanguage('js')->setHelp('Estilo del Geojson')->hideOnIndex(),
        ];
    }
}
