<template>
  <div>
    <h1>メニュー一覧</h1>
    <ul v-for="menu in menus" :key="menu.id">
      <li class="menuLi" @click="moveToEditPage(menu)">
        <a>{{menu.name}}</a>
      </li>
      <deleteModal :menu="menu" @getMenus='getMenus' />
    </ul>
  </div>
</template>

<script>
import axios from 'axios';
import deleteModal from './menuDeleteModal'

export default {
  components: { deleteModal },

  data: () => ({
    menus: ''
  }),

  created() {
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