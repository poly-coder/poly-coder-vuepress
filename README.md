---
title: Poly-Coder
home: true
---
# Home

<div>
  <Material-Paper 
    v-for="(s, index) in sizes" 
    :depth="s.depth" 
    :hover-depth="s.hover"
    :highlight="true"
    :key="'paper' + index"
    class="sample-paper">
    <span>{{ s.depth }} x {{ s.hover }}</span>
  </Material-Paper>
</div>

```fsharp
module FSharp.Core.Async

let returnM a = async.Return a
let bind f a = async.Bind(a, f)
let map f a = bind (f >> returnM) a

let failwith msg = async.Delay(fun () -> failwith msg)
let invalidArg name msg = async.Delay(fun () -> invalidArg name msg)
let nullArg msg = async.Delay(fun () -> nullArg msg)
let invalidOp msg = async.Delay(fun () -> invalidOp msg)

// Infix operators
module Infixes =
  let inline (>>=) a f = bind f a
  let inline (>>-) a f = map f a
```

<script>
export default {
  computed: {
    sizes() {
      const range = [0, 1, 2, 3, 4, 5];
      const iter = function*() {
        for (const depth of range) {
          for (const hover of range) {
            yield { depth, hover };
          }
        }
      }
      return Array.from(iter());
    }
  }
}
</script>

<style>
  .sample-paper {
    display: inline-flex;
    width: 120px;
    height: 120px;
    margin: 1em;
    background-color: #FFF;
    align-items: center;
    justify-content: center;
    cursor: pointer;
  }
</style>