<template>
    <div class="signin">
      <h1>ログイン</h1>
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
        password: ''
      }
    },
    created() {
      console.log(process.env)
    },
    methods: {
      signUp: function () {
        axios.post(`http://localhost:3000/api/v1/auth/sign_in`, {email: this.email, password: this.password}).then((res) => {
              if (res.status == 200) {
                let headers = res.headers
                localStorage.setItem('authInfos', JSON.stringify({token: headers['access-token'], client: headers['client'], uid: headers['uid']}))
                this.$router.push({name: 'machineNew'})
              }
            }, (error) => {
              console.log(error)
              alert(`ログインに失敗しました。${error}`)
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
