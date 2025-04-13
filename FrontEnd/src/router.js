import { createRouter, createWebHistory } from 'vue-router';
import Home from './views/Home.vue';
import ComponentsUpgrades from './views/Components&Upgrades.vue';
import ComputingEquipment from './views/Computing_equipment.vue';
import MobileGear from './views/Mobile_Gear.vue';
import Peripherals from './views/Peripherals.vue';
import PrintingScanning from './views/Printing&Scanning.vue';
import MonitorsDisplays from './views/Monitors&Displays.vue';

const routes = [
  { path: '/', component: Home, meta: { title: 'Home' } },
  { path: '/components-upgrades', component: ComponentsUpgrades, meta: { title: 'Components & Upgrades' } },
  { path: '/computing-equipment', component: ComputingEquipment, meta: { title: 'Computing Equipment' } },
  { path: '/mobile-gear', component: MobileGear, meta: { title: 'Mobile Gear' } },
  { path: '/peripherals', component: Peripherals, meta: { title: 'Peripherals' } },
  { path: '/printing-scanning', component: PrintingScanning, meta: { title: 'Printing & Scanning' } },
  { path: '/monitors-displays', component: MonitorsDisplays, meta: { title: 'Monitors & Displays' } },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const defaultTitle = 'GreenGizmos';
  document.title = to.meta.title || defaultTitle;
  next();
});

export default router;
