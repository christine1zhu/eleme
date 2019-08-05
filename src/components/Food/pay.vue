<template>
  <div class='pay'>
      <div class="header">
          <div class="button" @click="goback">＜</div>
          确认订单
      </div>
      <div class="background">
      </div>
      <div class="body">
        <div class="middle">
            <div class="address">浦东新区航科大厦</div>
            <div class='time'>立即送出</div>
            <div class="payway">支付方式</div>
        </div>
        <div class="order">
          <div class="seller">{{this.$store.state.seller.name}}</div>
            <div class='foodlist'>
              <ul>
                <li class='fooditem' v-for="(item,index) in foodinfo" :key='index'>
                  <div ><img :src='item.icon'/></div>
                  <div style="width:50vw">{{item.name}}</div>
                  <div style="width:10vw">×{{item.count}}</div>
                  <div style="width:10vw">¥{{item.price*item.count}}</div>
                </li>
              </ul>
              <div class='sum'>小计¥{{sum}}</div>
              </div>
        </div>
      </div>
      <div class="confirm">
        <span>¥{{sum}}</span>
        <div class='item2' @click='submit'>确认支付</div>
      </div>
         <!-- @on-cancel="onCancel"
                 @on-hide="onHide" -->
      <div v-transfer-dom>
        <confirm v-model="show"
        :title="msg"
        @on-confirm="onConfirm"
        @on-show="onShow"
        >
          <p style="text-align:center">确认支付？</p>
        </confirm>
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
  data () {
    return {
      foodinfo: this.$store.state.food_chosen || [],
      show: false,
      msg: '操作提示'
    }
  },
  computed: {
    sum: function () {
      return this.foodinfo.reduce((pre, cur) => {
        pre += cur.price * cur.count
        return pre
      }, 0)
    }
  },
  methods: {
    goback () {
      this.$router.back()
    },
    onConfirm () {
      let user = JSON.parse(sessionStorage.getItem('user'))
      const foods = this.foodinfo.reduce((pre, next) => {
        pre.push({
          'id': next.id,
          'count': next.count,
          'price': next.price,
          'sum_price': next.count * next.price
        })
        return pre
      }, [])
      if (user) {
        console.log(foods)
        this.axios.post('/eleme/pay',
          {'user': user.id, 'seller': this.$store.state.seller.shopid, 'foodlist': foods})
          .then(res => {
            if (res.data === 1) {
              alert('交易成功')
            } else {
              alert('交易失败')
            }
          })
      } else {
        alert('请登陆')
      }
    },
    // onHide () {
    //   console.log('on hide')
    // },
    onShow () {
      console.log('on show')
    },
    submit () {
      this.show = true
    }
    // submit () {
    //   let user = sessionStorage.getItem('user')
    //   if (user) {
    //     this.axios.post('/eleme/pay', this.qs.stringify(
    //       {'user': user, 'seller': this.$store.state.seller, 'foodlist': this.foodinfo}))
    //       .then(res => {
    //         if (res === '1') {
    //           alert('交易成功')
    //         } else {
    //           alert('交易失败')
    //         }
    //       })
    //   } else {
    //     alert('请登陆')
    //   }
    // }
  }
}
</script>

<style lang="less" scoped>
  .pay{
    .background{
      width: 100vw;
      height: 100vh;
      background:linear-gradient(#287DFA,aliceblue);
      position: fixed;
      z-index:-1;
    }
    .header{
      position: fixed;
      height: 31px;
      width: 100%;
      color: aliceblue;
      line-height: 31px;
      .button{
        position: fixed;
        left:5vw;
      }
    }
    .body{
      padding-top: 31px;
      .middle,.order{
        margin: 10px 5px;
        background-color: #fff;
        text-align: left;
        }
      .middle div{
          padding:15px 10px;
          border-bottom: 1px solid whitesmoke;
        }
      }
      .order{
        .seller{
           padding: 10px 10px;
           font-weight: bold;
           border-bottom: 1px solid whitesmoke;
        }
        ul{
          list-style: none;
          margin:0;
          padding:0;
          .fooditem{
            margin: 5px 5px;
            display: flex;
            align-items:center;
            img{
              width:10vw;
            }
            div{
              margin:5px;
            }
          }
        }
        .sum{
          text-align: right;
          padding:5px 20px 10px 5px;
        }
      }
      .confirm{
        position: fixed;
        bottom: 0px;
        width: 100vw;
        height: 40px;
        background-color: #2b333b;
        color: aliceblue;
        line-height: 40px;
        span{
          position: fixed;
          left:20px;
          bottom: 0px;
        }
        .item2{
          position: fixed;
          right:0px;
          bottom: 0px;
          width: 30vw;
          background-color: #00b43c;
        }
      }
    }
</style>
