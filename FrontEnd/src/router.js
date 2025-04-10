import { createRouter, createWebHistory } from 'vue-router';
import Home from './views/Home.vue';
import ComponentsUpgrades from './views/Components&Upgrades.vue';
import ComputingEquipment from './views/Computing_equipment.vue';
import MobileGear from './views/Mobile_Gear.vue';
import Peripherals from './views/Peripherals.vue';
import PrintingScanning from './views/Printing&Scanning.vue';
import MonitorsDisplays from './views/Monitors&Displays.vue';

const routes = [
  { path: '/', component: Home },
  { path: '/components-upgrades', component: ComponentsUpgrades },
  { path: '/computing-equipment', component: ComputingEquipment },
  { path: '/mobile-gear', component: MobileGear },
  { path: '/peripherals', component: Peripherals },
  { path: '/printing-scanning', component: PrintingScanning },
  { path: '/monitors-displays', component: MonitorsDisplays },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
