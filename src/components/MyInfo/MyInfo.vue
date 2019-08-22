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
        <img class='photo' :src='img' @click="changeimg()">
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
      <input id='file' type='button' value="确认修改" @click='changename()'>
    </div>
    <div class="set-img" v-show='showImg'>
      <div class='title'>修改头像</div>
      <img class='photo' :src='img'>
      <a class="file">上传头像
        <input type="file" id="uploadfile"
          @change="changepic(this)"
          accept="image/jpg,image/jpeg,image/png,image/PNG">
      </a>
      <a class="file"  @click='confirmpic()'>确认修改
        <input type="button">
      </a>
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
      Setting: false,
      showImg: false
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
    changeimg () {
      this.showImg = true
    },
    changepic () {
      var reads = new FileReader()
      // console.log(document.getElementById('uploadfile').files)
      var f = document.getElementById('uploadfile').files[0]
      reads.onload = function (e) {
        // console.log(this.result)
        // console.log(document.getElementsByClassName('photo'))
        document.getElementsByClassName('photo')[0].src = this.result
        document.getElementsByClassName('photo')[1].src = e.target.result
      }
      reads.readAsDataURL(f)
    },
    confirmpic () {
      let formdata = new FormData()
      var f = document.getElementById('uploadfile').files[0]
      console.log(f)
      if (!f) {
        alert('选择图片')
      } else {
        formdata.append('file', f)
        formdata.append('path', 'F:/SummerBankStudy/eleme1/static/UserImg')
        formdata.append('userid', this.userObj.id)
        let config = {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        }
        // let postdata = {data: formdata, user: this.userObj}
        this.axios.post('/eleme/UpdateImg', formdata, config)
          .then(res => {
            if (res.data.msg === 'success') {
              this.userObj.img = res.data.imgurl
              sessionStorage.setItem('user', JSON.stringify(this.userObj))
              this.showImg = false
            } else {
              alert('请上传头像')
            }
          }).catch(error => {
            console.log(error)
          })
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
  }}
</script>

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
  .set-img,.set-name{
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
    }}
  .set-name{
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
  .set-img{
    .photo{
      width: 80vw;
      height: 80vw;
      border-radius: 10px;
    }
    .file{
      position: relative;
      display: inline-block;
      background: #D0EEFF;
      border: 1px solid #99D3F5;
      border-radius: 4px;
      padding: 4px 12px;
      overflow: hidden;
      color: #1E88C7;
      text-decoration: none;
      text-indent: 0;
      line-height: 20px;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
    .file:hover {
        background: #AADFFD;
        border-color: #78C3F3;
        color: #004974;
        text-decoration: none;
    }
  }
}

</style>
