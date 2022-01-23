<template>
  <div>
    <h1>筋肉一覧</h1>
    <ul v-for="muscle in muscles" :key="muscle.id" class="machineUl">
      <li class="machineLi">
        <a>{{muscle.name}}</a>
        <v-btn color="primary" @click="moveMachinePageOfMuscle(muscle)">{{muscle.name}}を鍛えられるマシン一覧を見る</v-btn>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: () => ({
    muscles: ''
  }),

  created() {
    this.getMuscles()
  },

  methods: {
    getMuscles() {
      axios.get(`http://localhost:3000/api/v1/muscles`).then((res) => {
        this.muscles = res.data['muscles']
      })
    },
    moveMachinePageOfMuscle(muscle) {
      this.$router.push({name: 'muscleMachines', params: { muscle_id: muscle.id, muscle_name: muscle.name } })
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