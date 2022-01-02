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
            {{machine.name}}を削除しますか？
          </v-toolbar>
        <v-card-actions class="justify-end">
          <v-btn
            @click="deleteMachine()"
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
      {{machine.name}}を削除しました
    </v-snackbar>
    <v-snackbar
      v-model="notFoundSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{machine.name}}が見つかりませんでした
    </v-snackbar>
    <v-snackbar
      v-model="errorSnackBar"
      :timeout="timeout"
      color="error"
      centered
    >
      {{machine.name}}の削除に失敗しました
    </v-snackbar>
  </div>
</template>

<script>
import axios from 'axios';
  export default {
    props: ['machine'],
    data: () => ({
      deleteDialog: false,
      loading: false,
      timeout: 2000,
      snackbar: false,
      notFoundSnackBar: false,
      errorSnackBar: false
    }),

    methods: {
      deleteMachine() {
        this.loading = true
        axios.delete(`http://localhost:3000/api/v1/machine`, {data: {machine: {id: this.machine.id}}}).then((res) => {
          console.log(res)
          this.getMachines()
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

      getMachines() {
        this.$emit('getMachines')
      }
    }
  }
</script>

<style scoped>
  .deleteModalDiv {
    display: inline;
  }
</style>