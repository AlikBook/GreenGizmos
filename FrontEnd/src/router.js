import { createRouter, createWebHistory } from 'vue-router';
import Home from './views/Home.vue';
import ComponentsUpgrades from './views/Components&Upgrades.vue';
import ComputingEquipment from './views/Computing_equipment.vue';
import MobileGear from './views/Mobile_Gear.vue';
import Peripherals from './views/Peripherals.vue';
import PrintingScanning from './views/Printing&Scanning.vue';
import MonitorsDisplays from './views/Monitors&Displays.vue';
import Sign_up from './views/Sign_up.vue';
import Log_in from './views/Log_in.vue';
import Cart from './views/Cart.vue';
import SearchResults from './components/SearchResults.vue'; 
import AddProduct from './components/AddProduct.vue';
import UserManager from './views/UserManager.vue';
import DeleteProduct from './components/DeleteProduct.vue';

const routes = [
  { path: '/', component: Home, meta: { title: 'Home' } },
  { path: '/components-upgrades', component: ComponentsUpgrades, meta: { title: 'Components & Upgrades' } },
  { path: '/computing-equipment', component: ComputingEquipment, meta: { title: 'Computing Equipment' } },
  { path: '/mobile-gear', component: MobileGear, meta: { title: 'Mobile Gear' } },
  { path: '/peripherals', component: Peripherals, meta: { title: 'Peripherals' } },
  { path: '/printing-scanning', component: PrintingScanning, meta: { title: 'Printing & Scanning' } },
  { path: '/monitors-displays', component: MonitorsDisplays, meta: { title: 'Monitors & Displays' } },
  { path: '/sign-up', component: Sign_up, meta: { title: 'Sign Up' } },
  { path: '/log-in', component: Log_in, meta: { title: 'Log In' } },
  { path: '/cart', component: Cart, meta: { title: 'Cart' } },
  { path: '/search-results', component: SearchResults, meta: { title: 'Search Results' } },
  { path: '/add-product', component: AddProduct, meta: { title: 'Add Product' } },
  { path: '/delete-product', component: DeleteProduct, meta: { title: 'Delete Product' } },
  { path: '/user-manager', component: UserManager, meta: { title: 'User Manager' } },
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
