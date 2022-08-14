<template>
  <div>
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

    <h2>メニュー名</h2>
    <v-text-field label="メニュー名" v-model="menuName"></v-text-field>
  
    <h2>メニューに追加した食べ物</h2>
    <v-simple-table>
        <template v-slot:default>
          <thead>
          <tr>
              <th class="text-left">
                id
              </th>
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
              <th class="text-left">
                メニューに追加
              </th>
              <th class="text-left">
                メニューから削除
              </th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="food in selectedFoods"
              :key="food.id"
            >
              <td>{{food.id}}</td>
              <td @click="moveToEditPage(food)">{{ food.name }}</td>
              <td>{{ food.calorie }}</td>
              <td>{{ food.protein }}</td>
              <td>{{ food.fat }}</td>
              <td>{{ food.carbohydrate }}</td>
              <td>
                <div v-if="food.registered">
                  <td>
                    <v-checkbox
                      indeterminate
                      disabled
                      v-model="menuFoods"
                      :value="food.id"
                      @click="selectFood(food.id)"
                    ></v-checkbox>
                  </td>
                </div>
                <div v-else>
                  <v-checkbox
                    v-model="menuFoods"
                    :value="food.id"
                    @click="selectFood(food.id)"
                  ></v-checkbox>
                </div>
              </td>
              <td v-if="food.registered">
                <deleteModal :food="food" :menu="editTargetMenu" @editMenu='editMenu' @searchFoods='searchFoods' />
              </td>
            </tr>
          </tbody>
        </template>
    </v-simple-table>
    <div v-if="editTargetMenu">
      <v-form
        ref="form"
        lazy-validation
        @submit.prevent="updateMenu()"
      >
        <v-btn
          class="mr-4"
          type="submit"
          color="primary"
          v-if="editTargetMenu"
        >
          メニューを更新
        </v-btn>
      </v-form>
    </div>
    <div v-else>
      <v-form
        ref="form"
        lazy-validation
        @submit.prevent="createMenu()"
      >
        <v-btn
          class="mr-4"
          type="submit"
          color="primary"
        >
          メニューを作成
        </v-btn>
      </v-form>
    </div>
    <h2>食べ物一覧</h2>
    <v-simple-table>
        <template v-slot:default>
          <thead>
          <tr>
              <th class="text-left">
                id
              </th>
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
              <th class="text-left">
                メニューに追加
              </th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="food in foods"
              :key="food.id"
            >
              <td>{{food.id}}</td>
              <td @click="moveToEditPage(food)">{{ food.name }}</td>
              <td>{{ food.calorie }}</td>
              <td>{{ food.protein }}</td>
              <td>{{ food.fat }}</td>
              <td>{{ food.carbohydrate }}</td>
              <td>
                <v-checkbox
                  v-model="menuFoods"
                  :value="food.id"
                  @click="selectFood(food.id)"
                ></v-checkbox>
              </td>
            </tr>
          </tbody>
        </template>
    </v-simple-table>
  </div>
</template>

<script>
import food from '../../models/food.js'
import deleteModal from './deleteModal'
import axios from 'axios';

const newFood = new food()


export default {
  components: { deleteModal },
  props: ['editTargetMenu'],

  data: () => ({
    foods: '',
    menuFoods: [],
    searchItems: [{ conditionName: '以上', conditionvalue: 2}, { conditionName: '以下', conditionvalue: 1}],
    proteinCondition: '',
    fatCondition: '',
    carbohydrateCondition: '',
    calorieCondition: '',
    proteinNum: '',
    fatNum: '',
    carbohydrateNum: '',
    calorieNum: '',
    menuName: '',
    selectedFoods: []
  }),

  created () {
    if(this.editTargetMenu) {
      this.menuName = this.editTargetMenu.name
      this.editMenu()
      newFood.searchFoods({menu_id: this.editTargetMenu.id}).then(response => (this.foods = response.data['foods']))
    }else{
      newFood.searchFoods({}).then(response => (this.foods = response.data['foods']))
    }
  },

  methods: {
    searchFoods() {
      let menu_id = ''

      if(this.editTargetMenu){
        menu_id = this.editTargetMenu.id
      }

      newFood.searchFoods(
        {
          calorieCondition: this.calorieCondition,
          calorieNum: this.calorieNum,
          proteinCondition: this.proteinCondition,
          proteinNum: this.proteinNum,
          carbohydrateCondition: this.carbohydrateCondition,
          carbohydrateNum: this.carbohydrateNum,
          fatCondition: this.fatCondition,
          fatNum: this.fatNum,
          menu_id: menu_id
        }
      ).then(res => (this.foods = res.data['foods']))
    },

    selectFood(foodId) {
      let selectedFoodIds = []
      for (let i = 0; i < this.selectedFoods.length; i++){
        selectedFoodIds.push(this.selectedFoods[i].id)
      }

      if(selectedFoodIds.includes(foodId)) {
        for (let i = 0; i < this.selectedFoods.length; i++){
          if(this.selectedFoods[i].id == foodId) {
            let index = this.selectedFoods.indexOf(this.selectedFoods[i])
            this.selectedFoods.splice(index, 1)
          }
        }
      }else{
        for (let i = 0; i < this.foods.length; i++){
          if(this.foods[i].id == foodId) {
            this.selectedFoods.push(this.foods[i])
           
          }
        }
      }
    },

    createMenu() {
      axios.post(`http://localhost:3000/api/v1/menus`, {foods: this.selectedFoods, name: this.menuName}).then((res) => {
        console.log(res)
      })
    },

    updateMenu() {
      axios.patch(`http://localhost:3000/api/v1/menus`, {foods: this.selectedFoods, menu: {menu_id: this.editTargetMenu.id, name: this.menuName}}).then((res) => {
        console.log(res)
        this.editMenu()
        newFood.searchFoods({menu_id: this.editTargetMenu.id}).then(response => (this.foods = response.data['foods']))
      })
    },

    editMenu() {
      axios.get(`http://localhost:3000/api/v1/menus/${this.editTargetMenu.id}`).then((res) => {
        this.selectedFoods = res.data['registered_foods']
      })
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

  .foodElement {
    display: inline
  }
</style>