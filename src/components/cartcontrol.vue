<template>
    <div class="cartcontrol">
        <div class="decrease" v-show='curfood.count>0' @click="delcart">-</div>
        <div class="count" v-show='curfood.count>0'>{{curfood.count}}</div>
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
  data () {
    return {
      curfood: this.$store.state.food_chosen.find((item) => { return item.id === this.food.id }) || this.food
    }
  },
  methods: {
    addcart () {
      console.log('click')
      if (!this.curfood.count) {
        Vue.set(this.curfood, 'count', 1)
        this.$store.commit('ADD', this.curfood)
      } else {
        this.$store.commit('DEL', this.curfood)
        this.curfood.count += 1
        this.$store.commit('ADD', this.curfood)
      }
      // console.log(this.$store.state.food_chosen)
    },
    delcart () {
    //   console.log('del')
      this.$store.commit('DEL', this.curfood)
      this.curfood.count -= 1
      if (this.curfood.count) {
        this.$store.commit('ADD', this.curfood)
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
