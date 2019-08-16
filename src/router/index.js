import Vue from 'vue'
import Router from 'vue-router'
import Food from '@/components/Food/Food'
import Chat from '@/components/Chat/Chat'
import Chatroom from '@/components/Chat/Chatroom'
import Order from '@/components/Order/Order'
import MyInfo from '@/components/MyInfo/MyInfo'
import StoreList from '@/components/Food/StoreList'
import FoodList from '@/components/Food/FoodList'
import login from '@/components/login/login'
import Pay from '@/components/Food/pay'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/food',
      name: 'Food',
      component: Food,
      meta: {keepAlive: true}
    },
    {
      path: '/chat',
      name: 'Chat',
      component: Chat,
      meta: {keepAlive: true}
    },
    {
      path: '/chatroom',
      name: 'Chatroom',
      component: Chatroom,
      meta: {keepAlive: false}
    },
    {
      path: '/order',
      name: 'Order',
      component: Order,
      meta: {keepAlive: true}
    },
    {
      path: '/info',
      name: 'MyInfo',
      component: MyInfo,
      meta: {keepAlive: true}
    },
    {
      path: '/pay',
      name: 'pay',
      component: Pay
    },
    {
      path: '/login',
      name: 'login',
      component: login
    },
    {
      path: '/:CardId',
      name: 'StoreList',
      props: true,
      component: StoreList,
      meta: {keepAlive: false}
    },
    {
      path: '/:CardId/:shopId',
      name: 'FoodList',
      props: true,
      component: FoodList,
      meta: {keepAlive: false}
    }
  ],
  mode: 'history'
})

router.beforeEach((to, from, next) => {
  if (to.path === '/login') {
    next()
  } else {
    let token = sessionStorage.getItem('Authorization')
    if (token === 'null' || token === '') {
      next('/login')
    } else {
      next()
    }
  }
})

export default router
