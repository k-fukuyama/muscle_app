import Vue from 'vue';
import VueRouter from 'vue-router';
import muscleMachinesIndex from './components/muscle_machines/muscleMachinesIndex.vue'
import machineNew from './components/muscle_machines/new.vue'
import machineEdit from './components/muscle_machines/edit.vue'
import muscleIndex from './components/muscles/index.vue'
import muscleMachines from './components/muscles/machines.vue'
import foodIndex from './components/foods/index.vue'
import foodNew from './components/foods/new.vue'
import foodEdit from './components/foods/edit.vue'
import tipIndex from './components/tips/index.vue'
import tipShow from './components/tips/show.vue'
import tipNew from './components/tips/new.vue'
import tipEdit from './components/tips/edit.vue'
import menuIndex from './components/menus/index.vue'
import menuNew from './components/menus/new.vue'
import menuEdit from './components/menus/edit.vue'
import SignUp from './components/sign_up.vue';
import SignIn from './components/sign_in.vue';

Vue.use(VueRouter);

const router =  new VueRouter({
    routes: [
      { path: '/muscle_machines_index', name: 'signin', component: muscleMachinesIndex},
      { path: '/machine/new', name: 'machineNew', component: machineNew, meta: { requiresAuth: true }},
      { path: 'edit/:machine', name: 'machineEdit', component: machineEdit, props: true},
      { path: '/muscle/index', name: 'muscleIndex', component: muscleIndex },
      { path: '/muscle/machines', name: 'muscleMachines', component: muscleMachines, props: true },
      { path: '/foods/index', name: 'foodsIndex', component: foodIndex },
      { path: '/foods/new', name: 'foodsNew', component: foodNew },
      { path: '/foods/edit', name: 'foodsEdit', component: foodEdit, props: true },
      { path: '/tips/index', name: 'tipIndex', component: tipIndex},
      { path: '/tips/show', name: 'tipShow', component: tipShow, props: true },
      { path: '/tips/new', name: 'tipNew', component: tipNew },
      { path: '/tips/edit', name: 'tipEdit', component: tipEdit, props: true },
      { path: '/menus/index', name: 'menusIndex', component: menuIndex },
      { path: '/menus/new', name: 'menusNew', component: menuNew },
      { path: '/menus/edit', name: 'menusEdit', component: menuEdit, props: true },
      { path: '/sign_up', name: 'sign_up', component: SignUp, alias: "/" },
      { path: '/sign_in', name: 'sign_in', component: SignIn, alias: "/sign_in" }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth) && !localStorage.getItem('authInfos')) {
    next({ path: '/sign_in', query: { redirect: to.fullPath } });
  } else {
    next();
  }
});

export default router