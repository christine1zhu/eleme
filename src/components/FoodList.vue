<template>
  <div class='seller'>
    <p>{{ $route.params.CardId}}</p>
    <p>{{ $route.params.shopId}}</p>
  </div>
</template>

<script>
export default {
  name: 'SuperMarket',
  data () {
    return {
      msg: 'Welcome to SuperMarket'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
