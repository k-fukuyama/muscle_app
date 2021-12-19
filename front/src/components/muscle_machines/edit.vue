<template>
  <machineForm :editTargetMachine="machine" />
</template>

<script>
import machineForm from './machineForm'
export default {
  props: ['machine'],
  components: {
    machineForm
  },

  created() {
    console.log(this.machine)
  }
}
</script>