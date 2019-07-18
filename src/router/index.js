import Vue from 'vue'
import Router from 'vue-router'
import Food from '@/components/Food'
import SuperMarket from '@/components/SuperMarket'
import Order from '@/components/Order'
import MyInfo from '@/components/MyInfo'
import StoreList from '@/components/StoreList'
import FoodList from '@/components/FoodList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Food',
      component: Food
    },
    {
      path: '/market',
      name: 'SuperMarket',
      component: SuperMarket
    },
    {
      path: '/order',
      name: 'Order',
      component: Order
    },
    {
      path: '/info',
      name: 'MyInfo',
      component: MyInfo
    },
    {
      path: '/:CardId',
      name: 'StoreList',
      props: true,
      component: StoreList
    },
    {
      path: '/:CardId/:shopId',
      name: 'FoodList',
      props: true,
      component: FoodList
    }

  ]
})
