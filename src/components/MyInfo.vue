<template>
  <div class="MyInfo">
    <div class="header">
       <span class="icon iconfont" style="position:relative right:10px">&#xe71d;</span>
    </div>
    <div class="main">
      <div class="info">
        <div id='info1'>
          <h1>{{user}}</h1>
          <p>再忙，也要记得吃饭哟~</p>
          <p><span class="icon iconfont">&#xe62e;</span>签到领十元红包</p>
        </div>
        <img id='info2' src="@/assets/logo.png">
      </div>
      <group>
        <cell v-for='(item, index) in itemList' is-link :key='index' :title='item.title' :link='item.link' >
          <span slot='icon' class="icon iconfont" style="padding:0 20px" v-html="item.icon"></span>
        </cell>
      </group>
    </div>
    <div style="background-color:rgb(239, 239, 244)" >
      <divider>
        <span class="icon iconfont">&#xe875;</span>三小时公益
        <span class="icon iconfont">&#xe617;</span>资质与规则
      </divider>
    </div>
  </div>
</template>

<script>
import { Group, Cell, Divider } from 'vux'
export default {
  name: 'MyInfo',
  data () {
    return {
      user: 'ZhuQingYu',
      itemList: [
        {title: '我的收藏', link: '/', icon: '&#xe60f;'},
        {title: '我的客服', link: '/', icon: '&#xe673;'},
        {title: '推荐有奖', link: '/', icon: '&#xe60e;'},
        {title: '商务合作', link: '/', icon: '&#xe656;'},
        {title: '设置', link: '/', icon: '&#xe68d;'}
      ]
    }
  },
  components: {
    Group,
    Cell,
    Divider
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.MyInfo{
  text-align:left
}
.header{
  width: 100%;
  height:8%;
  position: fixed;
  top:0px;
  z-index: 1;
  background-color: rgb(239, 239, 244);
}
.main{
  margin-top:10%;
  margin-bottom: 10%;
}
.info{
  display: flex;
  justify-content: space-between;
}
#info1{
  margin: 30px;
  flex-grow: 8
}
#info2 {
  margin: 30px;
  width: 20%;
  height: 20%;
  border-radius:50%;
  box-shadow: 5px 5px 5px #888888;
}
p{
  font-size:15px;
  line-height: height;
}
/* .buttom{
  background-color:rgb(239, 239, 244);
} */
</style>
