<template>
  <menuForm :editTargetMenu="editTargetMenu" />
</template>

<script>
import menuForm from './menuForm'

export default {
  props: ['editTargetMenu'],

  components: {
    menuForm
  }
}
</script>