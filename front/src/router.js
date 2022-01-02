import Vue from 'vue';
import VueRouter from 'vue-router';
import muscleMachinesIndex from './components/muscle_machines/muscleMachinesIndex.vue'
import machineNew from './components/muscle_machines/new.vue'
import machineEdit from './components/muscle_machines/edit.vue'

Vue.use(VueRouter);

export default new VueRouter({
    routes: [
      { path: '/muscle_machines_index', name: 'signin', component: muscleMachinesIndex},
      { path: '/machine/new', name: 'machineNew', component: machineNew},
      { path: 'edit/:machine', name: 'machineEdit', component: machineEdit, props: true}
  ]
});