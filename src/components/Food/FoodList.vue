<template>
  <div class='seller'>
    <ul class="header">
      <li @click="goBack"><span class="iconfont" style="font-size:20px;text-align:left">&#xe677;</span></li>
      <li><span class="iconfont" style="font-size:20px">&#xe638;</span></li>
    </ul>
    <div class="mid">
      <storeinfo :seller='seller'></storeinfo>
    </div>
    <div class="main">
      <div class='main-tab'>
        <tab :line-width=2 active-color='#287DFA' v-model="index">
          <tab-item class="vux-center" :selected="demo === item" v-for="(item, index) in list" @click="demo = item" :key="index">{{item}}</tab-item>
        </tab>
      </div>
      <div class='body'>
        <div class='goods-page' v-if='index===0'>
          <Goods></Goods>
          <div class="goods-buttom">
              <shoppingcart :seller='seller'></shoppingcart>
          </div>
        </div>
        <div class='judge-page' v-if='index===1'>评价</div>
        <div class='seller-page' v-if='index===2'>商家</div>
      </div>
    </div>
    <!-- <p>{{ $route.params.CardId}}</p>
    <p>{{ $route.params.shopId}}</p> -->
  </div>
</template>

<script>
import { Tab, TabItem } from 'vux'
import Goods from '../Food/goods.vue'
import shoppingcart from '../shoppingcart.vue'
import storeinfo from '../Food/storeinfo.vue'
export default {
  name: 'foodlist',
  data () {
    return {
      list: ['点餐', '评价', '商家'],
      demo: '点餐',
      index: 0,
      seller: {}
    }
  },
  methods: {
    goBack () {
      this.$router.back()
    }
  },
  created () {
    this.axios.get('/eleme/storeinfo', {params: {cardId: this.$route.params.CardId, shopId: this.$route.params.shopId}})
      .then((res) => {
        let store = res.data[0]
        let supports = store.support.trim().split(',')
        Object.assign(store, {support: supports})
        this.seller = store
      }, (err) => {
        console.log(err)
      })
  },
  components: {
    Tab,
    TabItem,
    Goods,
    shoppingcart,
    storeinfo
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">
.seller{
  .header {
      background-color:#287DFA;
      color: aliceblue;
      position: fixed;
      padding: 0%;
      margin: 0%;
      top:0px;
      width: 100%;
      height: 6vh;
      list-style: none;
      display: flex;
      justify-content: space-between;
      li{
        padding: 5px 5vw;
      }
    }
  .mid{
    position: fixed;
    left:0px;
    top:6vh;
    z-index:1;
  }
  .main{
    .main-tab{
      position: fixed;
      top:120px;
      width: 100%;
    }
    .body{
      padding-top:164px;
    }
    .goods-buttom{
      position: fixed;
      bottom: 0px;
      z-index:2;
    }
  }
}

</style>
