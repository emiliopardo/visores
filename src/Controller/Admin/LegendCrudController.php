<?php

namespace App\Controller\Admin;

use App\Entity\Legend;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use Vich\UploaderBundle\Form\Type\VichFileType;
use Vich\UploaderBundle\Form\Type\VichImageType;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class LegendCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Legend::class;
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
            ImageField::new('imageName')->setBasePath('/images/legends')->hideOnForm()
        ];
    }

}
