<template>
  <div class="order">
    <div class="header">
      <p align='right' style="margin:20px 20px" >其他</p>
    </div>
    <div class="main">
      <h1>历史订单</h1>
      <ul>
        <li fr >
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Order',
  data () {
    return {
      msg: 'Welcome to Order'
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
