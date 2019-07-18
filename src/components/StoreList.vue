<template>
  <div>
    <div class="header">
        美食
    </div>
    <div class="main">
        <div class="storelist">
          <router-link v-for='i in 10' :key="i" to="/card1/shop1">
            <div class="store">
            <img class="left" src="http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg" >
            <div class="right">
              <h1 style="margin:0 10px text-algin:left">粥店</h1>
              <div><span>4.8</span><span>月售6978</span></div>
              <div><span>起送¥20</span><span>配送¥8</span></div>
              <div>
                <span>55减15</span>
                <span>85减30</span>
              </div>
            </div>
            </div>
          </router-link>
        </div>
      </div>
  </div>
    <!-- <p>板块ID：{{ $route.params.CardId}}</p>
    <h1>{{msg}}</h1> -->
</template>

<script>
export default {
  name: 'StoreList',
  data () {
    return {
      msg: 'Welcome to SuperMarket'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
span{
  margin:10px;
}
.store{
  display: flex;
  justify-content: space-around;
}
.left{
  flex-grow: 1;
  width: 10%;
}
.right{
  flex-grow: 2;
  text-align: left;
}
</style>
