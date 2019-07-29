<template>
<div class="goods">
    <div class="menu-scroller">
        <ul class="menu-list">
            <li v-for="item in goodsList" class="menu-item" :key='item.name'>{{item.name}}</li>
        </ul>
    </div>
    <div class="food-scroller">
        <ul class="food-list">
            <li v-for=" item in goodsList" :key='item.name' class="food-list-item">
                <ul class='foods'>
                    <li v-for="food in item.foods" :key='food.name' class="food-item">
                        <img class='image' :src="food.icon">
                        <div class="info">
                            <div class="title">{{food.name}}</div>
                            <div class="price">¥{{food.price}}</div>
                            <div class="cart-control">
                                <cartcontrol :food='food'></cartcontrol>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
</template>

<script>
import cartcontrol from '../cartcontrol.vue'
import shoppingcart from '../shoppingcart.vue'
export default {
  name: 'Goods',
  data () {
    return {
      goodsList: []
    }
  },
  created () {
    this.axios.get('/api/goods')
      .then((response) => {
        this.goodsList = response.data.data
      })
  },
  components: {
    cartcontrol,
    shoppingcart
  },
  methods: {
    showpay () {
      console.log(this.$store.food_chosen)
    }
  }
}
</script>

<style scoped lang="less">
.goods{
    ul{
        list-style: none;
        margin: 0;
        padding:0;
    }
    width: 100%;
    display: flex;
    top: 0px;
    bottom: 40px;
    .menu-scroller{
        background-color:whitesmoke;
        flex:0 0 100px;
        .menu-list{
            text-align: center;
            .menu-item {
                margin:30px 10px;
            }
        }
    }
    .food-scroller{
        flex:1;
        .food-item{
            display: flex;
            .image{
                flex:0 0 70px;
                width: 70px;
                padding: 10px;
            }
            .info {
                flex:1;
                padding: 10px;
                text-align: left;
                .price{
                    color:red;
                    display:inline-block;
                }
            }
            .cart-control{
                text-align: right;
            }
        }
    }
}

</style>
