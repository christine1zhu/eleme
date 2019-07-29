<template>
    <div>
       <input type="text" v-model="loginForm.username" placeholder="手机/邮箱/用户名">
       <input type="password" v-model="loginForm.password" placeholder="密码">
       <div>
           <button @click="login">登录</button>
       </div>
    </div>
</template>

<script>
import {mapMutations} from 'vuex'
export default {
  data () {
    return {
      loginForm: {
        username: '',
        password: ''
      }
    }
  },
  methods: {
    ...mapMutations(['changeLogin']),
    login () {
      let _this = this
      if (this.loginForm.username === '' || this.loginForm.password === '') {
        alert('账号或密码不能为空')
      } else {
        this.axios({
          method: 'post',
          url: '/eleme/login',
          data: _this.loginForm
        }).then(res => {
          if (res.data) {
            console.log(res.data.name)
            this.$store.commit('ChangeUser', res.data.name)
            _this.$router.push('/food')
            alert('登陆成功')
          } else {
            alert('账号或密码错误')
          }
        }).catch(error => {
          alert('账号或密码错误')
          console.log(error)
        })
      }
    }
  }
}
</script>

<style lang="less" scoped>

</style>
