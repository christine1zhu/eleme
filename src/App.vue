<template>
  <div id="app">
    <div class="buttom">
      <ul>
        <li v-for="(item,index) in datalist" :key="index">
          <router-link :to="item.link" >
            <div>
              <div class="icon iconfont" v-html="item.icon"></div>
              <span slot="label">{{item.info}}</span>
            </div>
          </router-link>
        </li>
        <!-- <li>
          <div class="icon iconfont">&#xe722;</div>
          <span slot="label">外卖</span>
        </li>
        <li>
          <div class="icon iconfont">&#xe722;</div>
          <span slot="label">外卖</span>
        </li>
        <li>
          <div class="icon iconfont">&#xe722;</div>
          <span slot="label">外卖</span>
        </li>
        <li>
          <div class="icon iconfont">&#xe722;</div>
          <span slot="label">外卖</span>
        </li>-->
      </ul>
    </div>
    <router-view/>
  </div>
</template>

<script>
import { Tabbar, TabbarItem } from 'vux'
const baseList = [
  { icon: '&#xe722;', info: '外卖', link: '/' },
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
  },
  components: {
    Tabbar,
    TabbarItem
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
  padding-bottom:10%;
}
.buttom {
  position: fixed;
  z-index:1;
  bottom: 0%;
  width: 100%;
  height: 10%;
  background-color:rgb(239, 239, 244);
  box-shadow: -2px -2px 5px #888888;
}
ul {
  width: 100%;
  padding: 0;
  margin: 0;
  display: flex;
  justify-content: center;
}
li {
  display: inline-block;
  flex-grow: 1;
  align-items: center;
}
.iconfont {
  font-size: 35px;
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
