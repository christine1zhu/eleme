<template>
  <div id="app">
      <router-view></router-view>
    <div class="buttom" v-show="this.$route.meta.keepAlive">
      <ul class="buttom-nav">
        <li class="buttom-item" v-for="(item,index) in datalist" :key="index">
          <router-link :to="item.link" >
            <div style="padding:5px">
              <div class="icon iconfont" v-html="item.icon"></div>
              <span style='font-size:10px' slot="label">{{item.info}}</span>
            </div>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
const baseList = [
  { icon: '&#xe722;', info: '外卖', link: '/food' },
  { icon: '&#xe602;', info: '超市', link: '/market' },
  { icon: '&#xe65c;', info: '订单', link: '/order' },
  { icon: '&#xe61a;', info: '我的', link: '/info' }
]

export default {
  name: 'App',
  data () {
    return {
      datalist: baseList
    }
  }
}
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin:0px;
}
.buttom {
  position: fixed;
  /* z-index:1; */
  border-top:0.5px solid #888888;
  bottom: 0%;
  width: 100%;
  height: 10%;
  background-color:rgb(239, 239, 244);
  /* box-shadow: -2px -2px 5px #888888; */
}
.buttom-nav {
  width: 100%;
  padding: 0;
  margin: 0;
  display: flex;
  justify-content: center;
}
.buttom-item {
  display: inline-block;
  flex-grow: 1;
  align-items: center;
}
.iconfont {
  font-size: 30px;
}
a{
  text-decoration:none;
  color:grey;
}
body{
  margin:0px;
  padding:0px;
}

</style>
