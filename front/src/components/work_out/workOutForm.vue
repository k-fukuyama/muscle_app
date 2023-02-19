<template>
  <div>
    <v-form
      ref="form"
      lazy-validation
      @submit.prevent="createOrUpdateWorkOut()"
    >
      <v-text-field
        v-model="work_out.name"
        label="トレーニング名"
      ></v-text-field>
      <v-select 
        item-text="partName"
        item-value="partValue"
        :items="partItems"
        label="部位" 
        v-model="work_out.part" 
        class="searchElement"
      >
      </v-select>
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
import WorkOut from '../../models/work_out.js'
const newWorkOutModel = new WorkOut()

export default {
  props: ['editTargetWorkOut'],

  data: () => ({
    work_out: newWorkOutModel,
    partItems: [{ partName: '胸筋', partValue: 0}, { partName: '肩', partValue: 1}, { partName: '腕', partValue: 2}, { partName: '背中', partValue: 3}, { partName: '足', partValue: 4}]
  }),

  created () {
  },

  methods: {
    createWorkOut() {
      axios.post(`http://localhost:3000/api/v1/work_outs`, this.work_out).then((res) => {
        console.log(res)
      })
    },

    updateWorkOut() {
      axios.patch(`http://localhost:3000/api/v1/work_out`, {work_out: this.work_out}).then((res) => {
        console.log(res)
      }).catch(({response}) => {
        if(response.status == 404){
          console.log('食材が見つかりませんでした')
        }
      })
    },

    createOrUpdateWorkOut() {
      if(this.editTargetWorkOut){
        this.updateWorkOut()
      }else{
        this.createWorkOut()
      }
    }
  }
}
</script>