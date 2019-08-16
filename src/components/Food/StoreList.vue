<template>
  <div id="Storelist">
    <ul class="header">
      <li @click='goBack'><span class="iconfont" style="color:white;font-size:20px">&#xe677;</span></li>
      <li>美食</li>
      <li><span class="iconfont" style="color:white;font-size:20px">&#xe638;</span></li>
    </ul>
    <scroller class="storelist" :on-infinite="infinite"  :on-refresh = "refresh" ref="my_scroller">
      <div class="store" v-for='(item,index) in storeInfo' :key="index" @click="goShop(item)">
      <div class="left">
          <img style="width:100%" :src="item.avatar" >
      </div>
      <div class="right">
        <div id='name'>{{item.name}}</div>
        <div><span style='color:red'>{{item.score}}</span><span>月售{{item.sellCount}}</span></div>
        <div><span>起送¥{{item.minPrice}}</span><span>配送¥{{item.deliveryPrice}}</span></div>
        <div>
          <span v-for='(i,index) in item.support' :key='index'>{{i}}</span>
        </div>
      </div>
      </div>
    </scroller>
  </div>
</template>

<script>
export default {
  data () {
    return {
      storeInfo: [],
      offset: 0,
      bottom: -1,
      fn: 4
    }
  },
  mounted () {
    this.getData(0, this.fn)
  },
  methods: {
    getData (offset, fn = this.fn) {
      this.axios.get('/eleme/storeinfo', {params: {cardId: this.$route.params.CardId, offset: offset, fn: fn}})
        .then((res) => {
          res.data.forEach(element => {
            let supports = element.support.trim().split(',')
            this.storeInfo.push(Object.assign(element, {support: supports}))
          })
          this.offset = offset + fn
        }, (err) => {
          console.log(err)
        })
    },
    goBack () {
      this.$router.back()
    },
    goShop (i) {
      this.$router.push({
        path: '/' + this.$route.params.CardId + '/' + i.shopid
      })
    },
    refresh (done) {
      console.log('refresh')
    },
    infinite (done) {
      if (this.offset >= 15) {
        setTimeout(() => {
          done(true)
        }, 1500)
        return
      }
      setTimeout(() => {
        this.getData(this.offset)
        done()
      }, 1000)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">
.header{
  background-color:#287DFA;
  color: aliceblue;
  position: fixed;
  padding: 0%;
  margin: 0%;
  top:0px;
  height:6vh;
  width: 100%;
  z-index: 101;
  list-style: none;
  li{
    display: inline-block;
    width: 25%;
    margin:5px;
    }
  }
.store{
  display: flex;
  justify-content: space-between;
  margin:5px 5px;;
}
.left{
  flex:0 0 30%;
  width: 30%;
}
.right{
  flex:1;
  text-align: left;
  margin-left:10px;
}
.storelist{
  padding-top:6vh;
}
span{
  font-size: 10px;
  margin:0 5px 0 0;
  color:grey;
}
#name {
  font-size: 15px;
  font-weight: bold;
}
li{
  margin:3% 3%;
}
</style>
