<template>
  <div>
    <h1>{{tip.title}}</h1>
    <p>{{tip.content}}</p>
  </div>
</template>

<script>
export default {
  props: ['tip']
}
</script>