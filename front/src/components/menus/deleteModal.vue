<template>
  <div class="deleteModalDiv">
  <v-btn color="error" @click="deleteDialog = true">削除</v-btn>
    <v-dialog
      transition="dialog-top-transition"
      max-width="600"
      v-model="deleteDialog"
    >
      <template>
        <v-card>
          <v-toolbar
            color="primary"
            dark
          >
            {{food.name}}を削除しますか？
          </v-toolbar>
        <v-card-actions class="justify-end">
          <v-btn
            @click="deleteFood()"
            color="error"
            block
            :loading="loading"
          >削除</v-btn>
          </v-card-actions>
        </v-card>
      </template>
    </v-dialog>

    <v-snackbar
      v-model="snackbar"
      :timeout="timeout"
      color="success"
      centered
    >
      {{food.name}}を削除しました
    </v-snackbar>
    <v-snackbar
      v-model="notFoundSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{food.name}}が見つかりませんでした
    </v-snackbar>
    <v-snackbar
      v-model="errorSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{food.name}}の削除に失敗しました
    </v-snackbar>
  </div>
</template>

<script>
import axios from 'axios';
  export default {
    props: ['menu', 'food'],
    data: () => ({
      deleteDialog: false,
      loading: false,
      timeout: 2000,
      snackbar: false,
      notFoundSnackBar: false,
      errorSnackBar: false
    }),

    methods: {
      deleteFood() {
        this.loading = true
        axios.delete(`http://localhost:3000/api/v1/menus/${this.menu.id}/food/${this.food.id}`).then((res) => {
          console.log(res)
          this.editMenu()
          this.searchFoods()
          this.loading = false
          this.deleteDialog = false
          this.snackbar = true
        }).catch(({response}) => {
          if(response.status == 404){
            this.notFoundSnackBar = true
          }else{
            this.errorSnackBar = true
          }
        })
      },

      editMenu() {
        this.$emit('editMenu')
      },

      searchFoods() {
        this.$emit('searchFoods')
      }
    }
  }
</script>

<style scoped>
  .deleteModalDiv {
    display: inline;
  }
</style>