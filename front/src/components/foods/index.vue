<template>
  <div>
    <h1>食材一覧</h1>
    <v-row>
      <v-col cols="4" class="foodCol">
        <div>
          <v-text-field label="カロリー" v-model="calorieNum" class="searchElement"></v-text-field>
          <v-text-field label="タンパク質" v-model="proteinNum" class="searchElement"></v-text-field>
          <v-text-field label="脂質" v-model="fatNum" class="searchElement"></v-text-field>
          <v-text-field label="炭水化物" v-model="carbohydrateNum" class="searchElement"></v-text-field>
        </div>
        <div>
          <v-select 
            :items="searchItems" 
            label="以上・以下" 
            v-model="calorieCondition" 
            class="searchElement"
            item-text="conditionName"
            item-value="conditionvalue"
          >
          </v-select>
          <v-select 
            :items="searchItems" 
            label="以上・以下" 
            v-model="proteinCondition" 
            class="searchElement"
            item-text="conditionName"
            item-value="conditionvalue"
          >
          </v-select>
          <v-select 
            :items="searchItems" 
            label="以上・以下" 
            v-model="fatCondition" 
            class="searchElement"
            item-text="conditionName"
            item-value="conditionvalue"
          >
          </v-select>
          <v-select 
            :items="searchItems" 
            label="以上・以下" 
            v-model="carbohydrateCondition" 
            class="searchElement"
            item-text="conditionName"
            item-value="conditionvalue"
          >
          </v-select>
        </div>
      </v-col>
    </v-row>
    <v-btn color="primary" @click="searchFoods()">検索</v-btn>
      <v-simple-table>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left">
                食品名
              </th>
              <th class="text-left">
                カロリー
              </th>
              <th class="text-left">
                タンパク質
              </th>
              <th class="text-left">
                脂質
              </th>
              <th class="text-left">
                炭水化物
              </th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="food in foods"
              :key="food.id"
            >
              <td @click="moveToEditPage(food)">{{ food.name }}</td>
              <td>{{ food.calorie }}</td>
              <td>{{ food.protein }}</td>
              <td>{{ food.fat }}</td>
              <td>{{ food.carbohydrate }}</td>
              <td>{{ food.carbohydrate }}</td>
              <td><deleteModal :food="food" @getFoods='getFoods' /></td>
            </tr>
          </tbody>
        </template>
    </v-simple-table>
  </div>
</template>

<script>
import axios from 'axios';
import deleteModal from './deleteModal'

export default {
  components: { deleteModal },

  data: () => ({
    foods: [],
    searchItems: [{ conditionName: '以上', conditionvalue: 2}, { conditionName: '以下', conditionvalue: 1}],
    proteinCondition: '',
    fatCondition: '',
    carbohydrateCondition: '',
    calorieCondition: '',
    proteinNum: '',
    fatNum: '',
    carbohydrateNum: '',
    calorieNum: ''
  }),

  created() {
    this.getFoods()
  },

  methods: {
    getFoods() {
      axios.get(`http://localhost:3000/api/v1/foods`).then((res) => {
        console.log(res.data)
        this.foods = res.data['foods']
      })
    },

    searchFoods() {
      console.log(this.proteinCondition)
      console.log(this.fatCondition)
      console.log(this.carbohydrateCondition)


      let getFoodsUrl = `http://localhost:3000/api/v1/foods?calorie_condition=${this.calorieCondition}&protein_condition=${this.proteinCondition}&fat_condition=${this.fatCondition}&carbohydrate_condition=${this.carbohydrateCondition}&protein_num=${this.proteinNum}&fat_num=${this.fatNum}&carbohydrate_num=${this.carbohydrateNum}&calorie_num=${this.calorieNum}`
      axios.get(getFoodsUrl).then((res) => {
        console.log(res.data)
        this.foods = res.data['foods']
      })
    },

    moveToEditPage(machine) {
      this.$router.push({name: 'foodsEdit', params: {food: machine}})
    }
  }
}
</script>

<style scoped>
  .foodCol {
    display: inherit
  }

  .searchElement {
    padding: 10px
  }
</style>