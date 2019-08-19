<template>
<div class="goods">
    <div ref="menuwrapper" class="menu-scroller">
        <ul class="menu-list">
            <li v-for="(item,index) in goodsList" class="menu-item" :class="{'current':currentIndex===index}"
            :key='item.type'
            @click="selectMenu(index,$event)">{{item.type}}</li>
        </ul>
    </div>
    <div ref="foodwrapper" class="food-scroller">
        <ul class="food-list">
            <li v-for=" item in goodsList" :key='item.type' class="food-list-item">
              <p style="margin:0;text-align:left;font-size:13px;padding:3px 2px; background-color:whitesmoke">{{item.type}}</p>
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
import BScroll from 'better-scroll'
export default {
  name: 'Goods',
  data () {
    return {
      goodsList: [],
      shopid: this.$route.params.shopId,
      scrollY: 0,
      listHeight: []
    }
  },
  computed: {
    currentIndex () {
      for (let i = 0; i < this.listHeight.length; i++) {
        let height1 = this.listHeight[i]
        let height2 = this.listHeight[i + 1]
        if (!height2 || (this.scrollY >= height1 && this.scrollY < height2)) {
          return i
        }
      }
      return 0
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
        this.$nextTick(() => {
          this._initScroll()
          this._calculateHeight()
        })
      }).catch(error => { console.log(error) })
  },
  mounted () {
    const options = {
      scrollY: true // 因为scrollY默认为true，其实可以省略
    }
    setTimeout(() => {
      this.scroll = new BScroll(this.$refs.foodwrapper, options)
    }, 20)
  },
  components: {
    cartcontrol
  },
  methods: {
    showpay () {
      console.log(this.$store.food_chosen)
    },
    changemenu (index) {
      this.urlAnchor = '#' + index
    },
    _initScroll () {
      this.menuScroll = new BScroll(this.$refs.menuwrapper, {
        click: true
      })
      this.foodScroll = new BScroll(this.$refs.foodwrapper, {
        click: true,
        probeType: 3
      })
      this.foodScroll.on('scroll', (pos) => {
        this.scrollY = Math.abs(Math.round(pos.y))
      })
    },
    _calculateHeight () {
      let foodList = this.$refs.foodwrapper.getElementsByClassName('food-list-item')
      let height = 0
      this.listHeight.push(height)
      for (let i = 0; i < foodList.length; i++) {
        let item = foodList[i]
        height += item.clientHeight
        this.listHeight.push(height)
      }
    },
    selectMenu (index, event) {
      let foodlist = document.getElementsByClassName('food-list-item')
      let el = foodlist[index]
      this.foodScroll.scrollToElement(el, 300)
    }
  }
}
</script>

<style scoped lang="less">
.goods{
    width: 100%;
    position: absolute;
    display: flex;
    top: 0px;
    bottom: 40px;
    overflow: hidden;
    ul{
        list-style: none;
        margin: 0;
        padding:0;
    }
    .menu-scroller{
        background-color:whitesmoke;
        flex:0 0 100px;
        .menu-list{
            text-align: center;
            .current{
              background-color: #fff;
            }
            .menu-item {
                padding:20px 10px;
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
