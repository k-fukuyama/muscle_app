<template>
  <div>
    <h1>食材一覧</h1>
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
    foods: []
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

    moveToEditPage(machine) {
      this.$router.push({name: 'foodsEdit', params: {food: machine}})
    }
  }
}
</script>