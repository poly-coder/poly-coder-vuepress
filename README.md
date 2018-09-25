---
title: Poly-Coder
home: true
---
# Home

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

