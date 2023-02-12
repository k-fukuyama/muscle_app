<template>
    <div class="signin">
      <v-form @submit.prevent="signUp">
        <v-container>
          <v-col
            cols="12"
            sm="6"
            md="3"
          >
            <v-text-field
              label="アドレス"
              v-model="email"
            ></v-text-field>
          </v-col>
          <v-col
            cols="12"
            sm="6"
            md="3"
          >
            <v-text-field
              label="パスワード"
              v-model="password"
              color="blue"
              type="password"
            ></v-text-field>
          </v-col>
          <v-col
            cols="12"
            sm="6"
            md="3"
          >
            <v-text-field
              label="パスワード確認"
              v-model="password_confirmation"
              color="blue"
              type="password"
            ></v-text-field>
          </v-col>
        </v-container>
        <v-btn
          class="mr-4"
          type="submit"
          color="primary"
          block
        >
        サインアップ
        </v-btn>
      </v-form>
  </div>
</template>

<script>
  import axios from 'axios';
  export default {
    name: 'SignUp',
    data: function () {
      return {
        email: '',
        password: '',
        password_confirmation: ''
      }
    },
    created() {
      if(localStorage.getItem('authInfos')){
        alert('すでにログインしています')
        this.$router.push({name: 'machineNew'})
      }
      console.log(process.env)
    },
    methods: {
      signUp() {
        axios.post(`http://localhost:3000/api/v1/auth`, {email: this.email, password: this.password, password_confirmation: this.password_confirmation}).then((res) => {
          if (res.status == 200) {
            let headers = res.headers
            localStorage.setItem('authInfos', JSON.stringify({token: headers['access-token'], client: headers['client'], uid: headers['uid']}))
          }
        }, (error) => {
              console.log(error)
              alert(`アカウント作成に失敗しました。${error}`)
            });
      }
    }
  }
</script>


<style scoped>
  .title {
    text-align: center
  }
</style>
