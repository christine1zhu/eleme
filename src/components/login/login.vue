<template>
<div>
  <div class="body">
    </div>
    <div class="login">
      <div class="item1">
        <input type="text" v-model="loginForm.username" placeholder="手机/邮箱/用户名">
      </div>
       <div class="item2">
         <input type="password" v-model="loginForm.password" placeholder="密码">
       </div>
       <div class="item3" >
           <button @click="login">登录</button>
       </div>
    </div>
    </div>
</template>

<script>
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
    login () {
      let _this = this
      if (this.loginForm.username === '' || this.loginForm.password === '') {
        alert('账号或密码不能为空')
      } else {
        this.axios.post('/eleme/login', this.qs.stringify(_this.loginForm)).then(res => {
          if (res.data) {
            sessionStorage.setItem('user', JSON.stringify(res.data))
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
.body{
  width: 100vw;
  height: 100vh;
  background-image: url('/static/images/7.jpg');
  opacity:0.7;
}
 .login{
  position: fixed;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  // background-color:whitesmoke;
  // opacity:0.6;
  padding: 30px 10px;
  border-radius: 10px;
  input,button{
    margin:10px;
    padding:5px;
    border-radius: 5px;
  }
  button{
    background-color: #287DFA;
    color: aliceblue;
    width:50%;
  }
}

</style>
