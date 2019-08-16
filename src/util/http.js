import axios from 'axios'
import router from '../router'
var instance = axios.create()
instance.defaults.timeout = 5000 // 响应时间
instance.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'
// instance.defaults.headers.post['Content-Type'] = 'application/json;charset=UTF-8' // 配置请求头
// axios.defaults.baseURL = '' // 配置接口地址
// instance.defaults.crossDomain = true
// instance.defaults.withCredentials = true; //设置cross跨域 并设置访问权限 允许跨域携带cookie信息
instance.defaults.headers.common['Authorization'] = '' // 设置请求头为 Authorization

// 配置发送请求前的拦截器 可以设置token信息
instance.interceptors.request.use(config => {
  /// 登录流程控制中，根据本地是否存在token判断用户的登录情况
  // 但是即使token存在，也有可能token是过期的，所以在每次的请求头中携带token
  // 后台根据携带的token判断用户的登录情况，并返回给我们对应的状态码
  // 而后我们可以在响应拦截器中，根据状态码进行一些统一的操作。
  const token = sessionStorage.getItem('Authorization')
  token && (config.headers.Authorization = token)
  return config
}, error => {
  return Promise.reject(error)
})

// 配置响应拦截器
instance.interceptors.response.use(res => {
  return res
}, error => {
  if (error.response) {
    switch (error.response.status) {
      case 401:
        alert('用户已过期')
        sessionStorage.removeItem('Authorization')
        router.replace({path: 'login'})
        // router.push('/login')
    }
  }
})
export default instance
