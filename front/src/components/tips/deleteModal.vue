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
            {{tip.title}}を削除しますか？
          </v-toolbar>
        <v-card-actions class="justify-end">
          <v-btn
            @click="deleteTip()"
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
      {{tip.title}}を削除しました
    </v-snackbar>
    <v-snackbar
      v-model="notFoundSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{tip.title}}が見つかりませんでした
    </v-snackbar>
    <v-snackbar
      v-model="errorSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{tip.title}}の削除に失敗しました
    </v-snackbar>
  </div>
</template>

<script>
import axios from 'axios';
  export default {
    props: ['tip'],
    data: () => ({
      deleteDialog: false,
      loading: false,
      timeout: 2000,
      snackbar: false,
      notFoundSnackBar: false,
      errorSnackBar: false
    }),

    methods: {
      deleteTip() {
        this.loading = true
        axios.delete(`http://localhost:3000/api/v1/tips`, {data: {tip: {id: this.tip.id}}}).then((res) => {
          console.log(res)
          this.getTips()
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

      getTips() {
        this.$emit('getTips')
      }
    }
  }
</script>

<style scoped>
  .deleteModalDiv {
    display: inline;
  }
</style>