<template>
  <div class="order">
    <div class="header">
      <span>历史订单</span>
    </div>
    <div class="main">
      <div class="order-item" v-for='(item,index) in orderObj' :key='index'>
        <div class="order-header">
          <div class="header-top">订单编号 {{item.order_id}}</div>
          <div class="header-middle">
            <img class="item1" :src="item.store_img">
            <div class="item2">
              <div>{{item.store_name}}</div>
              <div style="font-size:13px">{{item.create_Time}}</div>
            </div>
            <div class="item3">{{item.state}}</div>
          </div>
          <div class="header-bottom">
            <div class='item4'>{{item.food_list[0].goodName}} <span v-if='item.food_list.length>1'>等{{item.food_list.length}}件商品</span>
            </div>
            <span class="iconfont" v-show="!showflag.includes(index)" style="font-size:13px; color:#287DFA" @click="showDetails(index)">&#xe60d;</span>
            <span class="iconfont" v-show="showflag.includes(index)" style="font-size:13px; color:#287DFA" @click="HideDetails(index)">&#xe6c0;</span>
            <div class='item5'>¥{{item.totalPrice}}</div>
          </div>
          <div class="food-list" v-show="showflag.includes(index)">
            <div class="food-item" v-for='(value,index) in item.food_list' :key="index">
              <img class='item6' :src="value.goodImg">
              <div class='item7'>{{value.goodName}}</div>
              <div class='item8'>×{{value.count}}</div>
              <div class='item9'>¥{{value.sumPrice}}</div>
            </div>
          </div>
          <div class="check" v-show ="item.state==='待收货'">
            <button class="check1" >查看物流</button>
            <button class="check2" @click="confirm(item)">确认收货</button>
          </div>
          <div class="check" v-show ="item.state==='已确认'">
            <button class="check2" >提交评价</button>
          </div>
            <div v-transfer-dom>
              <confirm v-model="item.show"
              title="确认收货"
              @on-confirm="onConfirm(item)"
              >
                <p style="text-align:center">确认收货?</p>
              </confirm>
            </div>
          </div>
      </div>
    </div>
  </div>

</template>

<script>
import {Confirm, TransferDomDirective as TransferDom} from 'vux'
export default {
  directives: {
    TransferDom
  },
  components: {
    Confirm
  },
  name: 'Order',
  data () {
    return {
      orderObj: [],
      showflag: []
    }
  },
  created () {
    this.getInitialData()
  },
  methods: {
    showDetails (index) {
      this.showflag.push(index)
    },
    HideDetails (index) {
      let showflag = this.showflag
      this.showflag.splice(showflag.indexOf(index))
    },
    getInitialData () {
      const userObj = JSON.parse(sessionStorage.getItem('user'))
      this.axios.get('/eleme/order', {params: {userId: userObj.id}})
        .then((res) => {
          // console.log(res.data)
          if (res.data) {
            for (let item in res.data) {
              let foodList = []
              let totalPrice = 0
              res.data[item].forEach(element => {
                foodList.push({
                  'goodName': element.goodName,
                  'goodImg': element.goodImg,
                  'count': element.count,
                  'sumPrice': element.sumPrice
                })
                totalPrice = totalPrice + element.sumPrice
              })
              this.orderObj.push({
                'order_id': item,
                'store_name': res.data[item][0].storeName,
                'store_img': res.data[item][0].storeImg,
                'create_Time': res.data[item][0].createTime,
                'state': res.data[item][0].state,
                'food_list': foodList,
                'totalPrice': totalPrice,
                'show': false
              })
            }
          }
          this.orderObj.sort((a, b) => {
            return a.create_Time < b.create_Time ? 1 : -1
          })
        })
    },
    onConfirm (item) {
      this.axios.post('/eleme/comfirmOrder', this.qs.stringify({
        order_id: item.order_id
      })).then((res) => {
        if (res.data > 0) {
          item.state = '已确认'
        }
      })
    },
    confirm (item) {
      item.show = true
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang='less'>
.order{
  text-align: left;
   .header{
    width: 100%;
    height:5vh;
    position: fixed;
    z-index: 1;
    top:0px;
    background-color: white;
    box-shadow: 1px 1px 5px #e6e0e0;
    padding: 5px 10px;
    font-weight: bold;
  }
  .main{
    position: relative;
    top:6vh;
    padding-bottom:57px;
    .order-item{
      border-bottom:1px solid #e6e0e0;
      padding: 2vh 0;
      .order-header{
        .header-top{}
        .header-middle{
          display:flex;
          .item1,.item2,.item3{
            padding:2vw;
          }
          .item1{
            width: 15vw;
          }
          .item2{
            flex:1;
            div{
              margin-bottom:1vh;
            }
          }
          .item3{
            color:#287DFA
          }
        }
        .header-bottom{
          font-size:14px;
          padding-left:20vw;
          display:flex;
          align-items:center;
          span{
            flex:1;
          }
          .item4{
            padding:0 1vw;
          }
          .item5{
            padding:0 3vw;
          }
        }
        .food-list{
          font-size:14px;
          padding-left:20vw;
          .food-item{
            display:flex;
            .item6{
              height:5vw;
            }
            .item7{
              flex:1
            }
            .item8,.item9{
              width:10vw;
            }
            .item6,.item7,.item8,.item9{
              padding:2vw;
            }
          }
        }
        .check{
          display: flex;
          justify-content: flex-end;
          .check1,.check2{
          background-color: #fff;
          color: #287DFA;
          border-radius: 7px;
          border-style:1px;
          margin:5px 5px 0 0;
          border-width: 1px;
          border-color:#287DFA;
        }
        }
      }
    }
  }
}
</style>
