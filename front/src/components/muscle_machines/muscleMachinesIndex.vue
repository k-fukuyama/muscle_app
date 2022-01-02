<template>
  <div>
    <h1>筋トレ器具一覧</h1>
    <ul v-for="machine in machines" :key="machine.id" class="machineUl">
      <li class="machineLi" @click="moveToEditPage(machine)">
        <a>{{machine.name}}</a>
      </li>
      <deleteModal :machine="machine" @getMachines='getMachines' />
    </ul>

    <v-btn v-on:click="movePage('machineNew')">
      <span>筋トレ器具を登録</span>
    </v-btn>
  </div>
</template>

<script>
import axios from 'axios';
import deleteModal from './deleteModal'

export default {
  components: { deleteModal },
  data: () => ({
    machines: ''
  }),

  created() {
    this.getMachines()
  },

  methods: {
    getMachines() {
      axios.get(`http://localhost:3000/api/v1/machine`).then((res) => {
        this.machines = res.data['machines']
      })
    },

    movePage(page) {
      this.$router.push({name: page})
    },

    moveToEditPage(machine) {
      this.$router.push({name: 'machineEdit', params: {machine: machine}})
    }
  }
}
</script>

<style scoped>
  .machineLi {
    cursor: pointer;
    cursor: hand;
    display: inline;
  }

  .machineUl {
    margin-top: 10px;
  }
</style>