<template>
  <div 
    class="paper"
    :class="classes"
    @mouseover="mouseOver"
    @mouseout="mouseOut">
    <slot/>
  </div>
</template>

<script>
export default {
  props: {
    depth: { type: Number, default: 1 },
    hoverDepth: { type: Number, default: 2 },
    highlight: { type: Boolean, default: false },
    smooth: { type: Boolean, default: true },
  },
  data () {
    return {
      isMouseOver: false,
    }
  },
  computed: {
    classes() {
      const classes = {
        "smooth": this.smooth && true,
      }
      const depth = 
        (this.hoverDepth > 0 && this.highlight && this.isMouseOver)
        ? this.hoverDepth + this.depth 
        : this.depth;
      classes[`depth-${depth}`] = true;
      return classes;
    },
  },
  methods: {
    mouseOver () {
      this.isMouseOver = true;
    },
    mouseOut () {
      this.isMouseOver = false;
    }
  }
}
</script>

<style lang="stylus" scoped>
.paper
  &.smooth
    transition all 0.3s cubic-bezier(.25,.8,.25,1)
  &.depth-0
    box-shadow none
  &.depth-1
    box-shadow 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)
  &.depth-2
    box-shadow 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)
  &.depth-3
    box-shadow 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)
  &.depth-4
    box-shadow 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)
  &.depth-5
    box-shadow 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22)
  &.depth-6
    box-shadow 0 24px 43px rgba(0,0,0,0.35), 0 20px 15px rgba(0,0,0,0.22)
  &.depth-7
    box-shadow 0 29px 48px rgba(0,0,0,0.40), 0 25px 18px rgba(0,0,0,0.22)
  &.depth-8
    box-shadow 0 33px 53px rgba(0,0,0,0.45), 0 30px 20px rgba(0,0,0,0.22)
  &.depth-9
    box-shadow 0 38px 58px rgba(0,0,0,0.50), 0 35px 23px rgba(0,0,0,0.22)
  &.depth-10
    box-shadow 0 43px 63px rgba(0,0,0,0.55), 0 40px 25px rgba(0,0,0,0.22)
</style>

