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
            {{menu.name}}を削除しますか？
          </v-toolbar>
        <v-card-actions class="justify-end">
          <v-btn
            @click="deleteMenu()"
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
      {{menu.name}}を削除しました
    </v-snackbar>
    <v-snackbar
      v-model="notFoundSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{menu.name}}が見つかりませんでした
    </v-snackbar>
    <v-snackbar
      v-model="errorSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{menu.name}}の削除に失敗しました
    </v-snackbar>
  </div>
</template>

<script>
import axios from 'axios';
  export default {
    props: ['menu'],

    data: () => ({
      deleteDialog: false,
      loading: false,
      timeout: 2000,
      snackbar: false,
      notFoundSnackBar: false,
      errorSnackBar: false
    }),

    methods: {
      deleteMenu() {
        this.loading = true
        axios.delete(`http://localhost:3000/api/v1/menus/${this.menu.id}`).then((res) => {
          console.log(res.data.isDeleted)
          this.getMenus()
          this.loading = false
          this.deleteDialog = false
          this.snackbar = true
        }).catch(({res}) => {
          if(res.status == 404){
            this.notFoundSnackBar = true
          }else{
            this.errorSnackBar = true
          }
        })
      },

      getMenus() {
        this.$emit('getMenus')
      }
    }
  }
</script>

<style scoped>
  .deleteModalDiv {
    display: inline;
  }
</style>