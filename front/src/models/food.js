import axios from 'axios';

export default class Food {
  property() {
    return {
      id: '',
      name: '',
      protein: '',
      fat: '',
      carbohydrate: '',
      calorie: ''
    }
  }

  getFoods() {
    return axios.get(`http://localhost:3000/api/v1/foods`)
  }

  searchFoods({calorieCondition = '', proteinCondition = '', fatCondition = '', carbohydrateCondition = '', proteinNum = '', fatNum = '', carbohydrateNum = '', calorieNum = '', menu_id = ''}) {
    let getFoodsUrl = `http://localhost:3000/api/v1/foods?calorie_condition=${calorieCondition}&protein_condition=${proteinCondition}&fat_condition=${fatCondition}&carbohydrate_condition=${carbohydrateCondition}&protein_num=${proteinNum}&fat_num=${fatNum}&carbohydrate_num=${carbohydrateNum}&calorie_num=${calorieNum}&menu_id=${menu_id}`
    return axios.get(getFoodsUrl)
  }
}