<template>
  <div>
    <h1>{{muscle_name}}が鍛えられるマシン一覧</h1>
    <ul v-for="machine in machines" :key="machine.id" class="machineUl">
      <li v-for="videoUrl in machine.video_urls" :key="videoUrl" class="machineLi">
        <a>{{machine.name}}</a>
        <videoDialog :videoUrl="videoUrl" />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';
import videoDialog from './videoDialog'

export default {
  props: ['muscle_id', 'muscle_name'],
  components: { videoDialog },

  data: () => ({
    machines: ''
  }),

  created() {
    this.getMachinesByMuscle()
  },

  methods: {
    getMachinesByMuscle() {
      console.log(this)
      axios.get(`http://localhost:3000/api/v1/machine/muscle/${this.muscle_id}`).then((res) => {
        this.machines = res.data['machines']
      })
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