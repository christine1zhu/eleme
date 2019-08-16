<template>
  <div class="Chatroom" >
      <div class="header">
        <span class="iconfont" @click="goback">&#xe677;</span>
        {{this.toName}}
      </div>
      <div id="box">
        <ul class="body">
          <li :class="item.senderId===myId ? 'right' :'left'" v-for='(item,index) in historyList' :key='index'>
            <div class="item1"><img v-show="item.senderId===toId" :src="toImg"></div>
            <div class="item2"><div class="msg">{{item.msg}}</div></div>
            <div class="item1"><img v-show="item.senderId===myId" :src="myImg"></div>
          </li>
        </ul>
         <div class="divided">
           以上是历史消息
         </div>
        <ul class="body">
          <li :class="item.senderId===myId ? 'right' :'left'" v-for='(item,index) in msgList' :key='index'>
            <div class="item1"><img v-show="item.senderId===toId" :src="toImg"></div>
            <div class="item2"><div class="msg">{{item.msg}}</div></div>
            <div class="item1"><img v-show="item.senderId===myId" :src="myImg"></div>
          </li>
        </ul>
         <span id="msg_end" style="overflow:hidden"></span>
      </div>
      <div class="bottom">
          <span class="iconfont">&#xe62a;</span>
          <input class="text" type="text" ref="send">
          <span class="iconfont">&#xe609;</span>
          <span class="iconfont">&#xe74a;</span>
          <input class="send" type="button" value="发送" @click="sendMessage">
      </div>
  </div>
</template>

<script>
export default {
  name: 'Chatroom',
  data () {
    return {
      toId: this.$route.query.to,
      toImg: this.$route.query.toImg,
      toName: this.$route.query.toName,
      myId: '',
      myImg: '',
      myName: '',
      historyList: [],
      msgList: []
    }
  },
  mounted () {
    const Myinfo = JSON.parse(sessionStorage.getItem('user'))
    this.myId = Myinfo.id
    this.myImg = Myinfo.img
    this.myName = Myinfo.name
    let that = this
    let history = []
    this.axios.post('/eleme/queryMsg', this.qs.stringify({
      myId: that.myId,
      toId: that.toId
    })).then((res) => {
      res.data.forEach(element => {
        history.push({
          receiverId: element.receiver_id,
          senderId: element.sender_id,
          msg: element.chat_msg
        })
      })
    })
    this.historyList = history
    this.scrollToBottom()
    window.addEventListener('onmessageWS', this.getDataFunc)
  },
  beforeDestroy () {
    let that = this
    this.axios.post('/eleme/SignMsg', this.qs.stringify({
      myId: that.myId,
      toId: that.toId
    })).then(res => {
      console.log(res.data)
    })
  },
  updated () {
    this.scrollToBottom()
  },
  methods: {
    // 获得socket传来的数据并处理
    getDataFunc (e) {
      const MessageEvent = e.detail.data
      const wsdata = JSON.parse(MessageEvent.data)
      if (wsdata.senderId === this.toId && wsdata.receiverId === this.myId) {
        this.msgList.push({
          senderId: wsdata.senderId,
          msg: wsdata.msg})
      }
    },
    sendMessage () {
      if (this.$refs.send.value) {
        let senderId = JSON.parse(sessionStorage.getItem('user')).id
        let receiverId = this.$route.query.to
        const obj = {
          action: 1,
          chatMsg: {
            receiverId: receiverId,
            senderId: senderId,
            Msg: this.$refs.send.value
          }
        }
        this.socket.send(JSON.stringify(obj))
        this.msgList.push({
          senderId: senderId,
          msg: this.$refs.send.value
        })
        this.$refs.send.value = ''
      }
    },
    scrollToBottom () {
      // let div = document.getElementById('box')
      // div.scrollTop = div.scrollHeight
      var hid = document.getElementById('msg_end')
      hid.scrollIntoView()
    },
    goback () {
      this.$router.back()
    }
  }}

</script>
<style lang="less" scoped>
.Chatroom{
    .header{
        text-align: left;
        background-color: #287DFA;
        position: fixed;
        z-index: 1;
        width: 100vw;
        top:0;
        height: 6vh;
        line-height: 6vh;
        color: aliceblue;
        .iconfont{
          font-size: 15px;
          padding:10px;
        }
    }
    .divided{
      margin:0 auto;
      text-align: center;
      font-size:13px;
      position: relative;
    }
    .divided:before {
      content: "";
      position: absolute;
      width: 38px;
      height: 2px;
      top: 50%;
      background-color:#ccc;
      left: 20%;
    }
    .divided:after {
      content: "";
      position: absolute;
      width: 38px;
      height: 2px;
      top: 50%;
      background-color:#ccc;
      right: 20%;
    }
    .body{
        padding:6vh 0 6vh 0;
        margin:0;
        .left{
          text-align: left;
          .msg{
            background-color: aliceblue;
          }
        }
        .right{
          text-align: right;
          .msg{
            background-color:#287DFA;
          }
        }
        .left,.right{
          display: flex;
          align-items: flex-start;
          .item1{
            flex: 0 0 10vw;
            width: 10vw;
            height: 10vw;
            margin:2vw;
            img{
              width: 100%;
            }
          }
          .item2{
            // flex:1;
            width: 100%;
            margin:2vw 0;
            .msg{
              text-align: left;
            word-break: break-all;word-wrap: break-word;
            display: inline-block;
            padding:2vw;
            border-radius: 4px;
            max-width: 80%;
            }
          }
        }
    }
    .bottom{
        position: fixed;
        z-index: 1;
        display: flex;
        height: 6vh;
        bottom: 0;
        width: 100vw;
        align-items: stretch;
        background-color: whitesmoke;
        .iconfont{
          font-size: 25px;
          margin:1vw;
        }
        .text{
          flex:1;
          margin:1vw;
        }
    }
}
</style>
