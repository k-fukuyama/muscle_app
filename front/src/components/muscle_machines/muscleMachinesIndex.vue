<template>
  <div>
    <h1>筋トレ器具一覧</h1>
    <ul v-for="machine in machines" :key="machine.id">
      <li>{{machine.name}}</li>
    </ul>

    <v-btn v-on:click="movePage('machineNew')">
      <span>筋トレ器具を登録</span>
    </v-btn>
  </div>
</template>

<script>
import axios from 'axios';

export default {

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
    }
  }
}
</script>