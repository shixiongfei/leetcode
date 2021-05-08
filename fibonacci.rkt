#lang racket
(require racket/contract)

;; 斐波那契数
;; https://leetcode-cn.com/problems/fibonacci-number/


(define/contract (fib n)
  (-> exact-integer? exact-integer?)
  (define (inner-iter a b step)
    (if (<= step 0) a
        (inner-iter (+ a b) a (- step 1))))
  (inner-iter 0 1 n)
  )
