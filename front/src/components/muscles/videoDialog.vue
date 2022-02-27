<template>
  <v-row>
    <v-dialog
      v-model="dialog"
      max-width="100%"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="primary"
          dark
          v-bind="attrs"
          v-on="on"
        >
          鍛え方を見る
        </v-btn>
      </template>
      <v-card class="vCard" max-width="100%">
        <v-card-text max-width="100%">
          <div class="videoDiv" v-html="videoUrl"></div>
        </v-card-text>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
  export default {
    props: ['videoUrl'],
    data () {
      return {
        dialog: false,
      }
    },

    created() {
      console.log(this.videoUrl)
    }
  }
</script>

<style>
  .videoDiv, .vCard, .v-dialog, .v-card__text {
    height: 100%
  }
</style>