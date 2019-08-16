<template>
<div id='Food' >
  <div class='header'>
    <div class="head-item">
        <ul>
          <li style="flex-grow:5"><span class="icon iconfont">&#xe697;</span>上海</li>
          <li style="flex-grow:1"><span class="icon iconfont">&#xe65d;</span>扫码</li>
          <li style="flex-grow:1"><span class="icon iconfont">&#xe69a;</span>28度</li>
        </ul>
    </div>
    <div class="searcher">
      <input type="text" placeholder='搜索商家、商品名称'>
    </div>
  </div>
  <keep-alive>
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
          <div class="grid-center"><img style="width:100%" :src='grid3_imgs[i-1]'></div>
        </grid-item>
      </grid>
    </div>
    <div class='SaleZone'>
      <h4>优惠专区</h4>
      <grid>
        <grid-item  v-for="i in 2" :key="i">
          <span class="grid-center"><img style="width:100%" :src='SaleZone2_imgs[i-1]'></span>
        </grid-item>
      </grid>
      <grid>
        <grid-item  v-for="i in 4" :key="i">
          <span class="grid-center"><img style="width:100%" :src='SaleZone4_imgs[i-1]'></span>
        </grid-item>
      </grid>
    </div>
    <div class='Special'>
      <h4>专属推荐</h4>
      <grid>
        <grid-item  v-for="i in 2" :key="i">
          <span class="grid-center"><img style="width:100%" :src='Special2_imgs[i-1]'></span>
        </grid-item>
      </grid>
    </div>
    <div class='Great'>
      <h4>优享大牌</h4>
      <grid>
        <grid-item  v-for="i in 3" :key="i">
          <span class="grid-center"><img style="width:100%" :src='Great3_imgs[i-1]'></span>
        </grid-item>
      </grid>
    </div>
    <div class='GetFood'>
      <h4>到店自去</h4>
      <grid>
        <grid-item  v-for="i in 3" :key="i">
          <span class="grid-center"><img style="width:100%" :src='GetFood3_imgs[i-1]'></span>
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
  </keep-alive>
</div>
</template>

<script>
import { Grid, GridItem, Swiper, Search } from 'vux'
import Card from '../Food/Card.vue'
const imgList = [
  '//bpic.588ku.com//back_origin_min_pic/19/04/16/5eb4b6692fc91e7e1ca8fbb35724040b.jpg!/fw/750/quality/99/unsharp/true/compress/true',
  '//bpic.588ku.com//back_water_img/19/04/18/6f44ceefa65f142e906f016f21453795.jpg!/fw/750/quality/99/unsharp/true/compress/true',
  '//bpic.588ku.com//back_origin_min_pic/19/04/16/1cfebec607678a6b5857610414c7c971.jpg!/fw/750/quality/99/unsharp/true/compress/true'
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
      cardinfo: [],
      grid3_imgs: [
        'http://bpic.588ku.com/illus_water_img/19/05/28/0afafbb10f138208756013eadb2173c6.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        'http://bpic.588ku.com/illus_water_img/19/06/01/2cadabe78ed6510e30ed7b08e3855284.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        'http://bpic.588ku.com/illus_water_img/19/06/05/53b7d1cc73e12b20beb4d30f0254d8b2.jpg!/fw/750/quality/99/unsharp/true/compress/true'
      ],
      SaleZone2_imgs: [
        'http://bpic.588ku.com/illus_water_img/19/05/27/25ce8ca8185a9a328f471af46967f72c.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        'http://bpic.588ku.com/illus_water_img/19/06/06/fc81b05be209cd2e321077f23a7ac4f7.jpg'
      ],
      SaleZone4_imgs: [
        'http://bpic.588ku.com/element_origin_min_pic/19/03/06/db55b17c67563ee33d7c2b6e55522cb2.jpg',
        '//bpic.588ku.com/element_origin_min_pic/19/03/05/36dec126a49e7819a8344a6f82806340.jpg',
        '//bpic.588ku.com/element_origin_min_pic/19/03/06/bb45b53f04eeeb2b693689faf9dfd263.jpg',
        '//bpic.588ku.com/element_origin_min_pic/19/03/06/aaaf77adc9245fdc4bf30c8cfdf0b87e.jpg'
      ],
      Special2_imgs: [
        'http://bpic.588ku.com/illus_water_img/19/06/13/5c214670ffe8518c633d51df5989d490.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        'http://bpic.588ku.com/illus_water_img/19/06/14/620659d8fd5ff901ad9acb01f881b1e3.jpg!/fw/750/quality/99/unsharp/true/compress/true'
      ],
      Great3_imgs: [
        '//bpic.588ku.com/illus_water_img/19/06/11/e8ba2ac3bf25f3896d2e927b8b76edd8.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        '//bpic.588ku.com/illus_water_img/19/06/01/a63e9a951378e107982422b81e9e2fd0.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        '//bpic.588ku.com/illus_water_img/19/06/04/bf00dcc2a498cf054bc49f128ed15a8f.jpg!/fw/750/quality/99/unsharp/true/compress/true'
      ],
      GetFood3_imgs: [
        '//bpic.588ku.com/illus_water_img/19/06/11/79a285cf05e4b2965ebcdcecc340cb1f.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        '//bpic.588ku.com/illus_water_img/19/06/11/ea80c7db4d3c996a9d4fcf1533271bdc.jpg!/fw/750/quality/99/unsharp/true/compress/true',
        '//bpic.588ku.com/illus_water_img/19/05/28/701c36696d86e7d1f9e1d05b11fb3804.jpg!/fw/750/quality/99/unsharp/true/compress/true'
      ]

    }
  },

  components: {
    Grid,
    GridItem,
    Swiper,
    Search,
    Card
  },
  beforeMount () {
    this.getData()
  },
  methods: {
    getData () {
      // 调用内部接口获取静态json文件
      // this.axios.get('/api/cardinfo')
      //   .then((response) => {
      //     this.cardinfo = response.data.data
      //   }
      //   )
      // 调用后台数据
      this.axios.get('/eleme/cardinfo')
        .then(res => {
          this.cardinfo = res.data
        })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">
#Food {
  .header {
    background-color: black;
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 1;
    .iconfont{
      font-size:20px;
      margin:5px;
    }
    }
  .main{
    padding-top: 80px;
    }
  ul {
    list-style: none;
    width: 100%;
    height: 5%;
    padding: 0;
    margin:0;
    display: flex;
    align-content:space-between;
  }
  li {
    display: inline-block;
    color:white;
    padding: 5px;
    text-align: left;
  }
  input{
    width: 80%;
    border-radius: 15px;
    margin: 10px;
    height: 20px;
  }
  .grid5{
    display:flex;
    flex-wrap: wrap;
  }
  .grid5-item{
    box-sizing:border-box;
    display: inline-block;
    width:20%;
    padding:2vw;
  }
  .weui-grid{
    padding:5px;
  }
  h4{
    margin: 10px 0px;
  }
}

</style>
