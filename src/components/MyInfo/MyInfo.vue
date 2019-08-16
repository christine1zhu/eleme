<template>
  <div class="MyInfo">
    <div class="header">
       <span class="icon iconfont">&#xe71d;</span>
    </div>
    <div class="main">
      <div class="info">
        <ul class='info-list'>
          <li class="name">{{username || '欢迎登陆'}}</li>
          <li style="font-size:13px; margin: 10px 0">再忙，也要记得吃饭哟~</li>
          <li class="qiandao"><span class="icon iconfont">&#xe62e;</span>签到领十元红包</li>
        </ul>
        <img class='photo' :src='img'>
      </div>
      <group class="choices" >
          <cell class="choices-item"  v-for='(item, index) in itemList' :title='item.title' is-link :key='index' @click.native="popout">
            <span slot='icon' class="icon iconfont" style="padding:0 10px 0 0" v-html="item.icon"></span>
          </cell>
      </group>
    </div>
    <div class='bottom'>
      <divider>
        <span class="icon iconfont">&#xe875;</span><span>三小时公益</span>
        <span class="icon iconfont">&#xe617;</span><span>资质与规则</span>
      </divider>
    </div>
    <div class="set-name" v-show='Setting'>
      <div class='title'>修改用户名</div>
      <input class='name' type="text" v-model='username'>
      <p>用户名只能修改一次，5-24个字</p>
      <input class='submit' type='button' value="确认修改" @click='changename'>
    </div>
  </div>
</template>

<script>
import { Group, Cell, Divider } from 'vux'
export default {
  name: 'MyInfo',
  data () {
    return {
      userObj: {},
      username: '',
      img: '',
      itemList: [
        {title: '我的收藏', icon: '&#xe60f;'},
        {title: '我的客服', icon: '&#xe673;'},
        {title: '推荐有奖', icon: '&#xe60e;'},
        {title: '商务合作', icon: '&#xe656;'},
        {title: '设置', icon: '&#xe68d;'}
      ],
      Setting: false
    }
  },
  components: {
    Group,
    Cell,
    Divider
  },
  mounted () {
    const userObj = JSON.parse(sessionStorage.getItem('user'))
    this.userObj = userObj
    this.username = userObj.name
    this.img = userObj.img
  },
  methods: {
    popout (e) {
      if (e.target.innerText === '设置') {
        this.Setting = true
      }
    },
    changename () {
      this.Setting = false
      this.userObj.name = this.username
      this.axios.post('/eleme/UpdateUser', this.qs.stringify(this.userObj))
        .then(res => {
          if (res.data) {
            if (res.data === 1) {
              sessionStorage.setItem('user', JSON.stringify(this.userObj))
            } else {
              alert('修改失败')
            }
          }
        }).catch(error => {
          console.log(error)
        })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

.MyInfo{
  text-align:left;
  .header{
    width: 100%;
    height:5vh;
    position: fixed;
    z-index: 1;
    top:0px;
    background-color: white;
    box-shadow: 1px 1px 5px #e6e0e0;
    padding: 5px 10px;
    .iconfont{
      position: relative;
      line-height: 5vh;
    }
  }
  .main{
    position: relative;
    top:5vh;
    margin:5vh 1vw;
    .info{
      display: flex;
      justify-content: space-between;
      align-items: center;
      .info-list{
        list-style: none;
        margin: 5px 10px;
        padding:0;
        .name{
          font-size: 25px;
          font-weight: bold;
        }
        .qiandao{
          font-size:13px;
          margin: 10px 0;
          vertical-align: middle;
          .iconfont{
            font-size: 20px;
          }
        }
      }
      .photo {
        margin:0 5vw;
        width: 25vw;
        height: 25vw;
        border-radius:50%;
        box-shadow: 5px 5px 5px #888888;
      }
    }
    .choices{
      .choices-item{
        padding: 0 5vw;
      }
    }
  }
  .bottom{
    background-color:rgb(239, 239, 244);
    padding-bottom:40px;
    span {
      font-size:15px;
      padding:1vw 2vw;
    }
  }
  .set-name{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:40;
    background-color:white;
    text-align:center;
    .title{
      padding:20px;
    }
    .name{
      border-style:none;
      box-shadow: 0px 3px whitesmoke;
      width:90%;
      font-size:15px;
      padding:5px;
    }
    p{
      text-align:left;
      font-size:10px;
      padding-left: 15px;
    }
    .submit{
      width:90%;
      padding:5px;
      border-radius:5px;
      background-color:#287DFA;
      color:white;
    }
  }
}

</style>
