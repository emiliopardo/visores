<?php

namespace App\Controller\Admin;

use App\Entity\Icon;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use Vich\UploaderBundle\Form\Type\VichFileType;
use Vich\UploaderBundle\Form\Type\VichImageType;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class IconCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Icon::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            // the labels used to refer to this entity in titles, buttons, etc.
            ->setEntityLabelInSingular('Icono')
            ->setEntityLabelInPlural('Iconos')
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
            TextField::new('imageName')->hideOnForm(),
            TextField::new('description'),
            TextField::new('imageFile')->setFormType(VichFileType::class, [
                'delete_label' => 'delete?'
            ])->onlyOnForms(),
            ImageField::new('imageName')->setBasePath('/images/icons')->hideOnForm()
        ];
    }
}
