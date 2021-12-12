<template>
  <div>
    <v-form
      ref="form"
      lazy-validation
      @submit.prevent="postMachine()"
    >
      <v-text-field
        v-model="machine.name"
        label="器具の名称"
      ></v-text-field>
      <v-text-field
        v-model="machine.description"
        label="説明"
      ></v-text-field>
      <v-btn
        class="mr-4"
        type="submit"
        color="primary"
        block
      >
        登録
      </v-btn>
    </v-form>
  </div>
</template>

<script>
import axios from 'axios';
import machine from '../../models/machine.js'
const newMachine = new machine()

export default {
  data: () => ({
    machine: newMachine.property()
  }),

  created () {
    
  },

  methods: {
    postMachine() {
      axios.post(`http://localhost:3000/api/v1/machine`, {machine: this.machine}).then((res) => {
        console.log(res)
      })
    }
  }
}
</script>