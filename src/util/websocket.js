const WSS_URL = `ws://localhost:8088/ws`
let Socket
// let setIntervalWesocketPush = null

/** 建立连接 */
export default function getSocket () {
  if (Socket) {
    return Socket
  } else if ('WebSocket' in window) {
    console.log('建立websocket连接')
    Socket = new WebSocket(WSS_URL)
    Socket.onopen = onopenWS
    Socket.onmessage = onmessageWS
    Socket.onerror = onerrorWS
    Socket.onclose = oncloseWS
    return Socket
  } else {
    alert('Not support websocket')
  }
}
/** 打开WS之后发送心跳 */
export function onopenWS () {
  let setIntervalWesocketPush = setInterval(() => {
    let user = JSON.parse(sessionStorage.getItem('user'))
    if (user !== null && user !== undefined) {
      let obj = {
        action: 0,
        chatMsg: {
          senderId: String(user.id)
        }
      }
      Socket.send(JSON.stringify(obj))
      clearInterval(setIntervalWesocketPush)
    }
  }, 2000)
}
/** 连接失败重连 */
export function onerrorWS () {
  console.log('发生错误')
  Socket.close()
  getSocket() // 重连
}
/** WS数据接收统一处理 */
export function onmessageWS (e) {
  window.dispatchEvent(new CustomEvent('onmessageWS', {
    detail: {
      data: e
    }
  }))
}
/** 发送数据
 * @param eventType
 */
// export function sendWSPush (userId, eventTypeArr) {
//   const obj = {
//     action:1,
//     chatMsg
//     appId: userId,
//     cover: 0,
//     event: eventTypeArr
//   }
//   if (Socket !== null && Socket.readyState === 3) {
//     Socket.close()
//     createSocket() // 重连
//   } else if (Socket.readyState === 1) {
//     Socket.send(JSON.stringify(obj))
//   } else if (Socket.readyState === 0) {
//     setTimeout(() => {
//       Socket.send(JSON.stringify(obj))
//     }, 3000)
//   }
// }
/** 关闭WS */
export function oncloseWS () {
  // clearInterval(setIntervalWesocketPush)
  console.log('websocket已断开')
}
/** 发送心跳 */
// export function sendPing () {
//   let obj = {
//     action: 0,
//     senderId: sessionStorage.getItem('user').id
//   }
//   Socket.send(JSON.stringify(obj))
//   setIntervalWesocketPush = setInterval(() => {
//     obj = {
//       action: 0,
//       senderId: sessionStorage.getItem('user').id
//     }
//     Socket.send('ping')
//   }, 5000)
// }
