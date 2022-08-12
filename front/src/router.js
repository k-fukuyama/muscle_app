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

Vue.use(VueRouter);

export default new VueRouter({
    routes: [
      { path: '/muscle_machines_index', name: 'signin', component: muscleMachinesIndex},
      { path: '/machine/new', name: 'machineNew', component: machineNew},
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
      { path: '/menu/index', name: 'menuIndex', component: menuIndex }
  ]
});