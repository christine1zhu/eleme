<template>
    <div class="cartcontrol">
        <div class="decrease" v-show='food.count>0' @click="delcart">-</div>
        <div class="count" v-show='food.count>0'>{{food.count}}</div>
        <div class="add" @click="addcart">+</div>
    </div>
</template>

<script>
import Vue from 'vue'
export default {
  name: 'cartcontrol',
  props: {
    food: {
      type: Object
    }
  },
  methods: {
    addcart () {
      console.log('click')
      if (!this.food.count) {
        Vue.set(this.food, 'count', 1)
        this.$store.commit('ADD', this.food)
      } else {
        this.$store.commit('DEL', this.food)
        this.food.count += 1
        this.$store.commit('ADD', this.food)
      }
      // console.log(this.$store.state.food_chosen)
    },
    delcart () {
    //   console.log('del')
      this.$store.commit('DEL', this.food)
      this.food.count -= 1
      if (this.food.count) {
        this.$store.commit('ADD', this.food)
      }
    }
  }
}
</script>

<style scoped lang="less">
    .cartcontrol{
        font-size:20px;
        .decrease, .add{
            display: inline-block;
            padding: 0;
            margin:2px;
            width:15px;
            height:15px;
            font-size:15px;
            border:2px solid #287DFA ;
            border-radius: 50%;
            text-align: center;
            vertical-align: middle;
        }
        .decrease{
            color:#287DFA;
        }
        .count {
            display: inline-block;
            padding: 0 5px;
            margin:0;
            border: 1px solid lightgray;
            font-size:15px;
        }
        .add{
            background-color:#287DFA;
            color: white;
        }

    }
</style>
