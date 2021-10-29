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
            ->setTitle('Visores');//->renderContentMaximized();//->renderSidebarMinimized();
    }

    public function configureMenuItems(): iterable
    {
        return [
            MenuItem::linkToDashboard('Home', 'fa fa-home'),
            MenuItem::subMenu('Mapea', 'fa fa-globe')->setSubItems([
            MenuItem::linkToCrud('Cores', 'fas fa-cog', MapeaCore::class)
            ]),
            MenuItem::subMenu('Controles', 'fas fa-solar-panel')->setSubItems([
                MenuItem::linkToCrud('Controles', 'fas fa-tv', MapeaControl::class),
                MenuItem::linkToCrud('Configuraciones', 'fas fa-cogs', MapeaControlConfig::class)
            ]),
            MenuItem::subMenu('Plugins', 'fas fa-object-group')->setSubItems([
                MenuItem::linkToCrud('Plugins', 'fas fa-object-ungroup', MapeaPlugin::class),
                MenuItem::linkToCrud('Configuraciones', 'fas fa-cogs', MapeaPluginConfig::class)
            ]),
            MenuItem::subMenu('Layers', 'fas fa-layer-group')->setSubItems([
                MenuItem::linkToCrud('WMS', 'fas fa-th', MapeaLayerWMS::class),
                MenuItem::linkToCrud('Geojson', 'fas fa-vector-square', MapeaLayerGeojson::class),
            ]),
            MenuItem::subMenu('Imagenes', 'fas fa-images')->setSubItems([
                MenuItem::linkToCrud('Leyendas', 'fas fa-image', Legend::class),
                MenuItem::linkToCrud('Iconos', 'fas fa-icons', Icon::class)
            ]),
            MenuItem::subMenu('Usuarios', 'fas fa-id-card')->setSubItems([
                MenuItem::linkToCrud('Usuarios', 'fas fa-user', User::class)
            ])
            ];
    }
}
