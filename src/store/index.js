import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    seller: {},
    food_chosen: [],
    chat: {}, // 当处于/chat时，到达的某个未读消息 senderId,receicerId,msg
    Authorization: sessionStorage.getItem('Authorization') ? sessionStorage.getItem('Authorization') : ''
  },
  mutations: {
    // SET_TOKEN: (state, data) => {
    //   state.token = data
    //   window.sessionStorage.setItem('token', data)
    // }
    ADD: (state, data) => {
      state.food_chosen.push(data)
    },
    DEL: (state, data) => {
      const index = state.food_chosen.indexOf(data)
      state.food_chosen.splice(index, 1)
    },
    // 修改token，并将token存入localStorage
    changeLogin (state, user) {
      state.Authorization = user.Authorization
      sessionStorage.setItem('Authorization', user.Authorization)
    },
    SetSeller: (state, data) => {
      Object.assign(state.seller, data)
    },
    SetChat: (state, chat) => {
      state.chat = chat
    }
  }
})
