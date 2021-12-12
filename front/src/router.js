import Vue from 'vue';
import VueRouter from 'vue-router';
import muscleMachinesIndex from './components/muscle_machines/muscleMachinesIndex.vue'

Vue.use(VueRouter);

export default new VueRouter({
    routes: [
      { path: '/muscle_machines_index', name: 'signin', component: muscleMachinesIndex}
  ]
});