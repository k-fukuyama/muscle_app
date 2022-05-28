<template>
  <foodForm :editTargetFood="food" />
</template>

<script>
import foodForm from './foodForm'
export default {
  props: ['food'],
  components: {
    foodForm
  }
}
</script>