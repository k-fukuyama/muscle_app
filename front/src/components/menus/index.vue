<template>
  <div>
    <h1>メニュー一覧</h1>
    <ul v-for="menu in menus" :key="menu.id">
      <li class="menuLi" @click="moveToEditPage(menu)">
        <a>{{menu.name}}</a>
      </li>
      <deleteModal :menu="menu" @getMenus='getMenus' />
    </ul>

    <h2>本日のおすすめメニュー</h2>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">
              メニュー名
            </th>
            <th class="text-left">
              おすすめポイント
            </th>
          </tr>
        </thead>
          <tbody>
            <tr>
            <td>{{recommendMenu.name}}</td>
            <td>{{recommendMenu.memo}}</td>
            </tr>
          </tbody>
        </template>
    </v-simple-table>
  </div>
</template>

<script>
import axios from 'axios';
import deleteModal from './menuDeleteModal'

export default {
  components: { deleteModal },

  data: () => ({
    menus: '',
    recommendMenu: ''
  }),

  created() {
    this.getRecommendMenu()
    this.getMenus()
  },

  methods: {
    getMenus() {
      axios.get(`http://localhost:3000/api/v1/menus`).then((res) => {
        this.menus = res.data['menus']
      })
    },

    moveToEditPage(menu) {
      this.$router.push({name: 'menusEdit', params: {editTargetMenu: menu}})
    },

    getRecommendMenu() {
      axios.get(`http://localhost:3000/api/v1/menus/recommend`).then((res) => {
        this.recommendMenu = res.data['recommend']
      })
    }
  }
}
</script>

<style scoped>
  .menuLi {
    cursor: pointer;
    cursor: hand;
    display: inline;
  }
</style>