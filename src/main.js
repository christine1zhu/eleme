// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import '@/assets/icons/iconfont.css'
import '@/assets/icons/iconfont.js'
import store from './store/index.js'
import VueScroller from 'vue-scroller'
import getSocket from './util/websocket'
import instance from './util/http'
// import axios from 'axios'
// import VueAxios from 'vue-axios'
// Vue.use(VueAxios, axios)
// 全局使用axios方法如上注释
import qs from 'qs'
import animated from 'animate.css'

Vue.use(animated)
Vue.use(VueScroller)
Vue.prototype.qs = qs
Vue.prototype.socket = getSocket()
Vue.prototype.axios = instance
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
