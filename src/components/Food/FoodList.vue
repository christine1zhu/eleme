<template>
  <div class='seller'>
    <ul class="header">
      <li @click="goBack">返回</li>
      <li>搜索</li>
      <li>分享</li>
      <li>拼单</li>
    </ul>
    <div class="mid">
      <div class="mid-top">
        <img :src="seller.avatar"/>
        <ul class="info">
          <li><span>{{seller.name}}</span></li>
          <li><span>评价{{seller.score}}</span><span>月售{{seller.sellCount}}</span><span>{{seller.description}}/{{seller.deliveryTime}}分钟送达</span></li>
          <li v-if="seller.supports"><span>{{seller.supports[0].description}}</span><span>{{seller.supports.length}}个</span><span @click="ShowDetails">详情</span></li>
        </ul>
      </div>
      <div class="details" v-show="detailShow">
        <p>优惠详情</p>
        <ul v-if="seller.supports"  >
          <li v-for="item in seller.supports" :key="item.type">{{item.description}}</li>
        </ul>
         <p @click="HideDetails">关闭</p>
      </div>
      </div>
    <div class="main">
      <div class='main-tab' v-show="!detailShow">
        <tab :line-width=2 active-color='#287DFA' v-model="index">
          <tab-item class="vux-center" :selected="demo === item" v-for="(item, index) in list" @click="demo = item" :key="index">{{item}}</tab-item>
        </tab>
      </div>
      <div class='body'>
        <div class='goods-page' v-if='index===0'>
          <Goods></Goods>
          <div class="goods-buttom">
              <shoppingcart></shoppingcart>
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
export default {
  name: 'foodlist',
  data () {
    return {
      list: ['点餐', '评价', '商家'],
      demo: '点餐',
      index: 0,
      detailShow: false,
      // seller: {}
      seller: {
        'name': '粥店',
        'description': '蜂鸟专送',
        'deliveryTime': 38,
        'score': 4.2,
        'serviceScore': 4.1,
        'foodScore': 4.3,
        'rankRate': 69.2,
        'minPrice': 20,
        'deliveryPrice': 4,
        'ratingCount': 24,
        'sellCount': 90,
        'bulletin': '粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。',
        'supports': [
          {
            'type': 0,
            'description': '在线支付满28减5'
          },
          {
            'type': 1,
            'description': 'VC无限橙果汁全场8折'
          },
          {
            'type': 2,
            'description': '单人精彩套餐'
          }
        ],
        'avatar': 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg',
        'pics': [
          'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg?imageView2/1/w/180/h/180',
          'http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg?imageView2/1/w/180/h/180',
          'http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg?imageView2/1/w/180/h/180',
          'http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg?imageView2/1/w/180/h/180'
        ],
        'infos': [
          '该商家支持发票,请下单写好发票抬头',
          '品类:其他菜系,包子粥店',
          '北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340',
          '营业时间:10:00-20:30'
        ]
      }
    }
  },
  methods: {
    goBack () {
      this.$router.back()
    },
    ShowDetails () {
      this.detailShow = true
    },
    HideDetails () {
      this.detailShow = false
    }
    // getInitialData () {
    //   this.$http.get('/api/seller')
    //     .then((response) => {
    //       this.seller = Object.assign(this.seller, response.body.data)
    //     }, (err) => {
    //       console.log(err)
    //     })
    // }
  },
  // created () {
  //   this.getInitialData()
  // },
  components: {
    Tab,
    TabItem,
    Goods,
    shoppingcart
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
      list-style: none;
      li{
        display: inline-block;
        width: 20%;
        padding: 5px;
      }
    }
  .mid{
    position: fixed;
    width: 100%;
    margin-top:30px;
    background-color: whitesmoke;
    .mid-top{
        display: flex;
      img{
        float: 0 0 70px;
        width:70px;
        height:70px;
        margin:10px;
      }
      .info{
        padding-left:0;
        flex:1;
        list-style: none;
        text-align: left;
        li:nth-child(1) span {
          font-size: 15px;
          font-weight: bold;
        }
        span{
          font-size: 12px;
          margin: 5px;
        }
      }
    }
    .details{
      width:100%;
      position:fixed;
      top:120px;
      background-color:whitesmoke;
      z-index: 3;
      ul{
        list-style: none;
        padding-left:0;
      }
    }
  }
  .main{
    // position: relative;
    // top:120px;
    // z-index: -1;
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
    }
  }
}

</style>
