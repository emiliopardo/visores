<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\User;
use App\Entity\MapeaCore;
use App\Entity\MapeaControl;
use App\Entity\MapeaControlConfig;
use App\Entity\MapeaPlugin;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Visores');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('Dashboard', 'fa fa-home');
        // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
        yield MenuItem::linkToCrud('Mapea Core', 'fas fa-globe', MapeaCore::class);
        yield MenuItem::linkToCrud('Mapea Control', 'fas fa-globe', MapeaControl::class);
        yield MenuItem::linkToCrud('Mapea Control Config', 'fas fa-globe', MapeaControlConfig::class);
        yield MenuItem::linkToCrud('Mapea Plugin', 'fas fa-globe', MapeaPlugin::class);
        yield MenuItem::linkToCrud('Usuarios', 'fas fa-globe', User::class);
    }
}
