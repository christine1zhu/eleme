<template>
<div class="goods">
    <div class="menu-scroller">
        <ul class="menu-list">
            <li v-for="item in goodsList" class="menu-item" :key='item.type'>{{item.type}}</li>
        </ul>
    </div>
    <div class="food-scroller">
        <ul class="food-list">
            <li v-for=" item in goodsList" :key='item.type' class="food-list-item">
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
export default {
  name: 'Goods',
  data () {
    return {
      goodsList: [],
      shopid: this.$route.params.shopId
    }
  },
  created () {
    //   本地json文件调用
    // this.axios.get('/api/goods')
    //   .then((response) => {
    //     this.goodsList = response.data.data
    //   })
    this.axios.post('/eleme/goods', this.qs.stringify({shopid: this.shopid}))
      .then((res) => {
        let goodsarr = res.data
        const data = []
        goodsarr.forEach(item => {
          let index = data.findIndex((e) => { return e.type === item.type })
          if (index < 0) {
            data.push({
              type: item.type,
              foods: [item]
            })
          } else {
            data[index].foods.push(item)
          }
        })
        this.goodsList = data
        // const data = {}
        // goodsarr.forEach(item => {
        //   let type = String(item.type)
        //   if (type in data) {
        //     data[type].push(item)
        //   } else {
        //     data[type] = [item]
        //   }
        // })
        // this.goodsList = data
        console.log(this.goodsList)
      })
  },
  components: {
    cartcontrol
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
        .food-list .food-list-item:last-child .foods:last-child .food-item:last-child{
          padding-bottom:40px;
        }
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
