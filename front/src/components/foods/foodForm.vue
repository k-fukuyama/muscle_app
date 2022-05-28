<template>
  <div>
    <v-form
      ref="form"
      lazy-validation
      @submit.prevent="createOrUpdaterMachine()"
    >
      <v-text-field
        v-model="food.name"
        label="食品名"
      ></v-text-field>
      <v-text-field
        v-model="food.calorie"
        label="カロリー"
      ></v-text-field>
      <v-text-field
        v-model="food.protein"
        label="タンパク質"
      ></v-text-field>
      <v-text-field
        v-model="food.fat"
        label="脂質"
      ></v-text-field>
      <v-text-field
        v-model="food.carbohydrate"
        label="carbohydrate"
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
import food from '../../models/food.js'
const newFood = new food()

export default {
  props: ['editTargetFood'],

  data: () => ({
    food: newFood.property()
  }),

  created () {
    if(this.editTargetFood){
      this.food = this.editTargetFood
    }
  },

  methods: {
    postFood() {
      axios.post(`http://localhost:3000/api/v1/foods`, {food: this.food}).then((res) => {
        console.log(res)
      })
    },

    updateFood() {
      axios.patch(`http://localhost:3000/api/v1/foods`, {food: this.food}).then((res) => {
        console.log(res)
      }).catch(({response}) => {
        if(response.status == 404){
          console.log('食材が見つかりませんでした')
        }
      })
    },

    createOrUpdaterMachine() {
      if(this.editTargetFood){
        this.updateFood()
      }else{
        this.postFood()
      }
    }
  }
}
</script>