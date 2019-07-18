<template>
<div id='Food' >
  <div class='header'>
    <div class="head-item">
        <ul>
          <li style="flex-grow:5"><span class="icon iconfont">&#xe697;</span>上海浦东新区</li>
          <li style="flex-grow:1"><span class="icon iconfont">&#xe65d;</span>扫码</li>
          <li style="flex-grow:1"><span class="icon iconfont">&#xe69a;</span>28度</li>
        </ul>
    </div>
    <div class="searcher">
      <input type="text" placeholder='搜索商家、商品名称'>
    </div>
  </div>
  <div class="main">
    <div class="swiper">
      <swiper :list="data_list" auto height="180px" dots-class="custom-bottom" dots-position="center"></swiper>
    </div>
    <div class="grid5">
      <div class="grid5-item" v-for='item in cardinfo' :key='item.id'>
        <Card
          :msg='item.msg'
          :icon='item.icon'
          :id='item.id'
        ></Card>
      </div>
    </div>
    <div class="grid3">
      <grid>
        <grid-item v-for="i in 3" :key="i">
          <span class="grid-center">{{i}}</span>
        </grid-item>
      </grid>
    </div>
    <div class='SaleZone'>
      <h4>优惠专区</h4>
      <grid>
        <grid-item  v-for="i in 2" :key="i">
          <span class="grid-center">{{i}}</span>
        </grid-item>
      </grid>
      <grid>
        <grid-item  v-for="i in 4" :key="i">
          <span class="grid-center">{{i}}</span>
        </grid-item>
      </grid>
    </div>
    <div class='Special'>
      <h4>专属推荐</h4>
      <grid>
        <grid-item  v-for="i in 2" :key="i">
          <span class="grid-center">{{i}}</span>
        </grid-item>
      </grid>
    </div>
    <div class='Great'>
      <h4>优享大牌</h4>
      <grid>
        <grid-item  v-for="i in 3" :key="i">
          <span class="grid-center">{{i}}</span>
        </grid-item>
      </grid>
    </div>
    <div class='GetFood'>
      <h4>到店自去</h4>
      <grid>
        <grid-item  v-for="i in 3" :key="i">
          <span class="grid-center">{{i}}</span>
        </grid-item>
      </grid>
    </div>
    <div class="swiper">
      <swiper :list="data_list" auto height="180px" dots-class="custom-bottom" dots-position="center"></swiper>
    </div>
    <div class='Stores'>
      <h4>推荐商家</h4>
    </div>
  </div>
</div>
</template>

<script>
import { Grid, GridItem, Swiper, Search } from 'vux'
import Data from '../../basedata.json'
import Card from '@/components/Card'
const imgList = [
  'http://img0.imgtn.bdimg.com/it/u=178230438,2028218868&fm=26&gp=0.jpg',
  'http://img5.imgtn.bdimg.com/it/u=655130840,1265809887&fm=26&gp=0.jpg',
  'http://img4.imgtn.bdimg.com/it/u=2859072233,200492921&fm=26&gp=0.jpg'
]
const demoList = imgList.map((one, index) => ({
  url: 'javascript:',
  img: one
}))
export default {
  name: 'Food',
  data () {
    return {
      data_list: demoList,
      cardinfo: Data.cardinfo
    }
  },
  components: {
    Grid,
    GridItem,
    Swiper,
    Search,
    Card
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header{
  background-color: black;
  width: 100%;
  height: 15%;
  position: fixed;
  top: 0%;
  z-index:1;
}
.main{
  margin-top: 20%;
}
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
  display: flex;
  align-content:space-between;
}
li {
  display: inline-block;
  margin: 0 10px;
  color:white;
  align-items:center;
}
a {
  color: #42b983;
}
input{
  width: 90%;
  border-radius: 15px;
  margin: 20px;
  height: 20px;
}
.swiper-demo-img img {
  width: 100%;
}
.grid5{
  display:flex;
  flex-wrap: wrap;
  margin:10px;
}
.grid5-item{
  width:15% ;
  display: inline-block;
  margin:5px 10px;
}
</style>
