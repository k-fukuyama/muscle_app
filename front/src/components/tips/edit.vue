<template>
  <tipForm :editTargetTip="editTargetTip" />
</template>

<script>
import tipForm from './tipForm'

export default {
  props: ['editTargetTip'],
  
  components: {
    tipForm
  }
}
</script>