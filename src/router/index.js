import Vue from 'vue'
import Router from 'vue-router'
import Food from '@/components/Food/Food'
import SuperMarket from '@/components/SuperMarket/SuperMarket'
import Order from '@/components/Order/Order'
import MyInfo from '@/components/MyInfo/MyInfo'
import StoreList from '@/components/Food/StoreList'
import FoodList from '@/components/Food/FoodList'
import login from '@/components/login/login'
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
      path: '/market',
      name: 'SuperMarket',
      component: SuperMarket,
      meta: {keepAlive: true}
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
  let user = sessionStorage.getItem('user')
  if (user) {
    next()
  } else {
    next('/login')
  }
})

export default router
