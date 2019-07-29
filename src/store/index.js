import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    food_chosen: [],
    user: ''
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
    ChangeUser: (state, data) => {
      state.user = data
      sessionStorage.setItem('user', data)
    }
  }
})
