<template>
  <div id="app">
      <!-- <div id="msg" :class="false? :">{{this.msg}}</div> -->
    <transition name="fade"
      enter-active-class="animated fadeInDown"
      leave-active-class="animated fadeOutUp">
      <div v-if="show" class="incomemsg">
        {{this.msg}}
      </div>
    </transition>
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
  { icon: '&#xe628;', info: '饿友', link: '/chat' },
  { icon: '&#xe65c;', info: '订单', link: '/order' },
  { icon: '&#xe61a;', info: '我的', link: '/info' }
]

export default {
  name: 'App',
  data () {
    return {
      datalist: baseList,
      msg: '',
      show: false
    }
  },
  mounted () {
    window.addEventListener('onmessageWS', this.getDataFunc)
  },
  methods: {
    getDataFunc (event) {
      const MessageEvent = event.detail.data
      const wsdata = JSON.parse(MessageEvent.data)
      if (wsdata.senderId === '饿了么') {
        this.msg = wsdata.msg
        this.show = true
        setTimeout(() => { this.show = false }, 2000)
      }
      // else {
      //   this.msgnumber += 1
      //   this.msg = '你有' + this.msgnumber + '条未读消息'
      // }
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
  width: 100vw;
}
.incomemsg{
  background-color:azure;
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
  position: fixed;
  top:0;
  line-height: 8vh;
  height: 8vh;
  width: 100vw;
  z-index: 6000;
  border-left: 1px solid #888888;
  border-right: 1px solid #888888;
  box-shadow: 1px 1px 5px #888888;
}
.buttom {
  position: fixed;
  z-index:10;
  border-top:0.5px solid #888888;
  bottom: 0px;
  left:0px;
  width: 100vw;
  height: 10vh;
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
