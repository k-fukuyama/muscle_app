<template>
  <div>
    <h1>コツ一覧</h1>
    <v-btn color="primary" @click="moveToNew()">コツを新規作成</v-btn>
    <ul v-for="tip in tips" :key="tip.id" class="machineUl">
      <li class="machineLi">
        <a @click="moveToShow(tip)">{{tip.title}}</a>
        <v-btn color="primary" @click="moveToEdit(tip)">編集</v-btn>
        <deleteModal :tip="tip" @getTips='getTips'></deleteModal>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';
import deleteModal from './deleteModal'

export default {
  components: { deleteModal },

  data: () => ({
    tips: []
  }),

  created() {
    this.getTips()
  },

  methods: {
    getTips() {
      axios.get(`http://localhost:3000/api/v1/tips`).then((res) => {
        console.log(res.data)
        this.tips = res.data['tips']
      })
    },

    moveToShow(tip) {
      this.$router.push({name: 'tipShow', params: { tip: { title: tip.title, content: tip.content } } })
    },

    moveToEdit(tip) {
      this.$router.push({name: 'tipEdit', params: { editTargetTip: tip } })
    },

    moveToNew() {
      this.$router.push({name: 'tipNew' })
    }
  }
}
</script>

<style scoped>
  .machineLi {
    cursor: pointer;
    cursor: hand;
    display: inline;
  }

  .machineUl {
    margin-top: 10px;
  }
</style>