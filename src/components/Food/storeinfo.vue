<template>
    <div class="storeinfo">
        <div class="mid-top">
            <img :src="seller.avatar"/>
            <ul class="info">
            <li><span>{{seller.name}}</span></li>
            <li><span>评价{{seller.score}}</span><span>月售{{seller.sellCount}}</span><span>{{seller.description || ''}}/{{seller.deliveryTime}}分钟送达</span></li>
            <li v-if="seller.support"><span>{{seller.support[0]}}</span><span>{{seller.support.length}}个</span><span @click="ShowDetails">详情</span></li>
            </ul>
        </div>
        <div class="details" v-show="detailShow">
            <p>优惠详情</p>
            <ul v-if="seller.support"  >
            <li v-for="(item,index) in seller.support" :key="index">{{item}}</li>
            </ul>
            <p @click="HideDetails">关闭</p>
        </div>
    </div>
</template>

<script>
export default {
  name: 'storeinfo',
  props: {
    seller: {
      type: Object
    }
  },
  data () {
    return {
      detailShow: false
    }
  },
  methods: {
    ShowDetails () {
      this.detailShow = true
    },
    HideDetails () {
      this.detailShow = false
    }
  }
}
</script>

<style lang="less" scoped>
.storeinfo{
    width:100vw;
    background-color: whitesmoke;
    .mid-top{
      height:90px;
      display: flex;
      img{
        // float: 0 0 70px;
        width:70px;
        height:70px;
        margin:5px;
      }
      .info{
        margin:5px;
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
          margin:0 2px;
        }
      }
    }
    .details{
      width:100%;
      background-color:whitesmoke;
      ul{
        list-style: none;
        padding-left:0;
      }
    }
}
</style>
