<template>
  <div>
    <v-form
      ref="form"
      lazy-validation
      @submit.prevent="createOrUpdateTip()"
    >
      <v-text-field
        v-model="tip.title"
        label="タイトル"
      ></v-text-field>
      <v-textarea
        outlined
        label="本文"
        v-model="tip.content"
      ></v-textarea>
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
import tipModel from '../../models/tip.js'
const newTip = new tipModel()

export default {
  props: ['editTargetTip'],

  data: () => ({
    tip: ''
  }),

  created () {
    console.log(this.editTargetTip)
    if(this.editTargetTip){
      this.tip = this.editTargetTip
    }else{
      this.tip = newTip
    }
  },

  methods: {
    postTip() {
      axios.post(`http://localhost:3000/api/v1/tips`, {tip: this.tip}).then((res) => {
        console.log(res)
      })
    },

    updateTip() {
      axios.patch(`http://localhost:3000/api/v1/tips`, {tip: this.tip}).then((res) => {
        console.log(res)
      }).catch(({response}) => {
        if(response.status == 404){
          console.log('食材が見つかりませんでした')
        }
      })
    },

    createOrUpdateTip() {
      if(this.editTargetTip){
        this.updateTip()
      }else{
        this.postTip()
      }
    }
  }
}
</script>