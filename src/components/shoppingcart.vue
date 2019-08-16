<template>
<div class="shoppingcart" >
    <div class="pay" >
        <span class="iconfont" style="color:white" @click="showpay">&#xe602;</span>
        <div class="sum" @click="topay">去结算</div>
    </div>
    <div class="shopcart-list" v-show="listShow">
        <div class="list-header">
            <div class="title">购物车</div>
            <div class="empty" @click="empty">关闭</div>
        </div>
        <div class="list-content" ref="listContent">
            <ul class='list-food'>
                <li class="food" v-for="(food, index) in foodList" :key='index'>
                    <span class="name">{{food.name}}</span>
                    <div class="price">
                        <span>¥{{food.price*food.count}}</span>
                    </div>
                    <div class="cartcontrol-wrapper">
                        <span>{{food.count}}个</span>
                        <!-- <cartcontrol :food="food"></cartcontrol> -->
                    </div>
                </li>
                <li>总计¥{{sum}}</li>
            </ul>
        </div>
    </div>
    <div class="list_mask" v-show="listShow" @click='empty'>
    </div>
</div>
</template>

<script>
import cartcontrol from './shoppingcart.vue'
export default {
  name: 'shoppingcart',
  data () {
    return {
      listShow: false,
      foodList: []
    }
  },
  props: {
    seller: {
      type: Object
    }
  },
  components: {
    cartcontrol
  },
  computed: {
    sum: function () {
      return this.foodList.reduce((pre, cur) => {
        pre += cur.price * cur.count
        return pre
      }, 0)
    }
  },
  methods: {
    showpay () {
      this.listShow = true
      this.foodList = this.$store.state.food_chosen ? this.$store.state.food_chosen : []
    },
    empty () {
      this.listShow = false
    },
    topay () {
      this.$store.commit('SetSeller', this.seller)
      this.$router.push({path: '/pay', query: { shopid: this.$route.params.shopId }})
    }
  }
}
</script>

<style scoped lang="less">
.shoppingcart{
    width: 100vw;
    .shopcart-list{
        width:100%;
        background-color: white;
        position: absolute;
        bottom:40px;
        z-index: 1;
        font-size: 15px;
        .list-header{
            display: flex;
            justify-content: space-between;
            background-color:whitesmoke;
            .title, .empty{
                margin:5px 20px;
            }
        }
        .list-content{
            margin: 10px 2px;
            .list-food{
                list-style: none;
                margin:0;
                padding: 0;
                .food{
                    display: flex;
                    text-align:left;
                    align-items:center;
                    margin:10px;
                    .name{
                        width: 60vw;
                    }
                    .price, .cartcontrol-wrapper{
                        width: 20vw;
                    }
                }
            }
        }
    }
    .pay{
        height: 40px;
        background-color: #2b333b;
        z-index: 1;
        .iconfont{
          position: absolute;
          left: 5vw;
          font-size: 40px;
        }
        .sum{
            line-height: 40px;
            width: 100px;
            position: absolute;
            z-index: 1;
            right: 0;
            background-color:#00b43c;
        }
    }
    .list_mask{
        position: fixed;
        left:0;
        top:0;
        width:100%;
        height:100%;
        background: rgba(7,17,27,0.6);
    }
}

</style>
