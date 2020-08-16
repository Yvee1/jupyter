-- If your code isn't running fast enough, you can just put it into a module.
module A.B where

fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)