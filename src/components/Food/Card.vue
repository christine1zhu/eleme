<template>
    <div class="card">
        <router-link :to='id'>
            <img :src="icon">
            <p>{{msg}}</p>
        </router-link>
    </div>
</template>

<script>
export default {
  name: 'Card',
  props: {
    msg: String,
    icon: String,
    id: String
  },
  data () {
    return {
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
p{
    padding: 0;
    margin: 0;
    font-size: 10px;
}
img{
  border-radius: 50%;
  width:100%;
}
</style>
