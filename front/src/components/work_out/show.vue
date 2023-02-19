<template>
  <div>
    <h1>{{muscle_name}}が鍛えられる種目</h1>
    <ul v-for="work_out in work_outs" :key="work_out.id" class="customeUl">
      <li class="customeLi">
        <p>{{work_out.name}}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: ['muscle_id', 'muscle_name'],

  data: () => ({
    work_outs: ''
  }),

  created() {
    this.getMachinesByMuscle()
  },

  methods: {
    getMachinesByMuscle() {
      axios.get(`http://localhost:3000/api/v1/work_outs/${this.muscle_id}`).then((res) => {
        console.log(res.data)
        this.work_outs = res.data['work_outs']
      })
    }
  }
}
</script>

<style scoped>
  .customeLi {
    cursor: pointer;
    cursor: hand;
    display: inline;
  }

  .customeUl {
    margin-top: 10px;
  }
</style>