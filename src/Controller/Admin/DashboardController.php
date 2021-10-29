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
use App\Entity\MapeaPluginConfig;
use App\Entity\MapeaLayerWMS;
use App\Entity\MapeaLayerGeojson;
use App\Entity\Legend;
use App\Entity\Icon;

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
        // yield MenuItem::linktoDashboard('Dashboard', 'fa fa-home');
        // yield MenuItem::linkToCrud('Mapea Core', 'fas fa-globe', MapeaCore::class);
        // yield MenuItem::linkToCrud('Mapea Control', 'fas fa-globe', MapeaControl::class);
        // yield MenuItem::linkToCrud('Mapea Control Config', 'fas fa-globe', MapeaControlConfig::class);
        // yield MenuItem::linkToCrud('Mapea Plugin', 'fas fa-globe', MapeaPlugin::class);
        // yield MenuItem::linkToCrud('Usuarios', 'fas fa-globe', User::class);
        return [
            MenuItem::subMenu('Mapea', 'fa fa-article')->setSubItems([
            MenuItem::linkToCrud('Mapea Core', 'fas fa-globe', MapeaCore::class)
            ]),
            MenuItem::subMenu('Controles', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Mapea Control', 'fas fa-globe', MapeaControl::class),
                MenuItem::linkToCrud('Mapea Control Config', 'fas fa-globe', MapeaControlConfig::class)
            ]),
            MenuItem::subMenu('Plugins', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Mapea Plugin', 'fas fa-globe', MapeaPlugin::class),
                MenuItem::linkToCrud('Mapea Plugin Config', 'fas fa-globe', MapeaPluginConfig::class)
            ]),
            MenuItem::subMenu('Layers', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Layer WMS', 'fas fa-globe', MapeaLayerWMS::class),
                MenuItem::linkToCrud('Layer Geojson', 'fas fa-globe', MapeaLayerGeojson::class),
                //MenuItem::linkToCrud('Mapea Plugin Config', 'fas fa-globe', MapeaPluginConfig::class)
            ]),
            MenuItem::subMenu('Imagenes', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Leyendas', 'fas fa-paint', Legend::class),
                MenuItem::linkToCrud('Iconos', 'fas fa-paint', Icon::class)
            ]),
            MenuItem::subMenu('Usuarios', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Usuarios', 'fas fa-user', User::class)
            ])
            ];
    }
}
