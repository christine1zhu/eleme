<template>
  <div class="Chat">
    <div class="header">好友列表</div>
    <div class="chat-item" v-for="(item,index) in friendslist" :key='index' @click="gotoChatrrom(item)">
      <div class="item1"><img :src="item.friendImg"></div>
      <div class="flag" v-if="item.number" :ref="item.friendId">{{item.number}}</div>
      <div class="item2">
        <div>{{item.friendName}}</div>
        <div class="p"><span  v-if="item.number">[{{item.number}}条未读消息]</span>{{item.message}}</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Chat',
  data () {
    return {
      my_id: JSON.parse(sessionStorage.getItem('user')).id,
      friendslist: []
    }
  },
  mounted () {
    this.getFriendList()
    // setTimeout(this.getHistoryMsgNumber(1), 0)
    // console.log(this.friendslist instanceof Array)
    // // console.log('数组为' + this.friendslist)
    // console.log(this.friendslist.length)
    // console.log(JSON.parse(JSON.stringify(this.friendslist)))
    // let friendsId = []
    // for (let item in this.friendslist) {
    //   console.log(item)
    //   console.log(item.friendId)
    //   friendsId.push(item.friendId)
    // }
    // const friendsId = friendslist.reduce((pre, cur) => { return pre.push(cur.friendId) }, [])
    // console.log(friendsId)
    // this.getHistoryMsgNumber(friendsId)
    window.addEventListener('onmessageWS', this.getDataFunc)
    // this.socket.onmessage = this.onmessageWS
  },
  methods: {
    gotoChatrrom (item) {
      this.$router.push({path: '/chatroom', query: {from: this.my_id, to: item.friendId, toImg: item.friendImg, toName: item.friendName}})
    },
    getFriendList () {
      const data = []
      this.axios.get('/eleme/friends', {params: {my_id: this.my_id}})
        .then((res) => {
          res.data.forEach(element => {
            data.push({
              friendName: element.friendName,
              friendImg: element.friendImg,
              friendId: element.senderId,
              number: element.number || 0,
              message: element.msg
            })
          })
          this.friendslist = data
        })
    },
    // getHistoryMsgNumber (friendsId) {
    //   console.log(friendsId)
    //   this.axios.post('/eleme/queryMsgNumber', this.qs.stringify({my_id: this.my_id}, {friends_Id: friendsId}))
    //     .then((res) => {
    //       console.log(res)
    //     })
    // },
    getDataFunc (e) {
      const MessageEvent = e.detail.data
      const wsdata = JSON.parse(MessageEvent.data)
      let dataitem = this.friendslist.find((item) => { return item.friendId === wsdata.senderId })
      dataitem.number += 1
      dataitem.message = wsdata.msg
    }
  }
  // onmessageWS (event) {
  //   console.log('未查看的信息', JSON.parse(event.data))
  //   let incomingdata = JSON.parse(event.data)
  //   if (incomingdata.senderId === '饿了么') {
  //     alert(incomingdata.msg)
  //   } else {
  //     let dataitem = this.friendslist.find((item) => { return item.friendId === incomingdata.senderId })
  //     dataitem.number += 1
  //     dataitem.message = incomingdata.msg
  //   }
  // }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="less" scoped>
.Chat{
  margin-top: 7vh;
  text-align: left;
  .header{
    width: 100%;
    height:5vh;
    line-height: 5vh;
    position: fixed;
    z-index: 1;
    top:0px;
    left:0px;
    background-color: white;
    box-shadow: 1px 1px 5px #e6e0e0;
    padding: 5px 10px;
    font-weight: bold;
  }
  .chat-item{
    width: 100vw;
    border-color: whitesmoke;
    display: flex;
    // align-items: center;
    border-bottom:1px solid #e6e0e0;
    .item1{
      flex-shrink:0;
      width:15vw;
      margin:1vw 2vw;
      img{
        width: 100%;
      }
    }
    .flag{
      width: 5vw;
      height:5vw;
      line-height: 5vw;
      background-color:#287DFA;
      border-radius: 50%;
      position: absolute;
      color: aliceblue;
      left:13vw;
      font-size: 2vw;
      text-align: center;
    }
    .item2{
      width: 85vw;
      margin: 1vw 2vw;
      .p{
        width:75vw;
        font-size:12px;
        color: gray;
        margin:1vh 0;
        // overflow: hidden;
        // white-space: nowrap;
        // text-overflow:ellipsis;
        display:block;
        word-break:keep-all;
        white-space:nowrap;
        overflow:hidden;
        text-overflow:ellipsis;

      }
    }
  }
}
</style>
