import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    seller: {},
    food_chosen: [],
    user: {}
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
      Object.assign(state.user, data)
      sessionStorage.setItem('user', JSON.stringify(state.user))
    },
    SetSeller: (state, data) => {
      Object.assign(state.seller, data)
    }
  }
})
