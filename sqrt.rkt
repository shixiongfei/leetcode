#lang racket
(require racket/contract)

;; x 的平方根
;; https://leetcode-cn.com/problems/sqrtx/description


(define/contract (my-sqrt x)
  (-> exact-integer? exact-integer?)
  (define (inner-iter low high)
    (let* ([mid (/ (+ low high) 2)]
           [m2 (* mid mid)])
      (cond
        [(< (abs (- m2 x)) 1e-7) (floor (+ mid 1/100000))]
        [(< m2 x) (inner-iter (+ mid 1) high)]
        [else (inner-iter low (- mid 1))])))
  (if (<= x 1) x (inner-iter 0 x))
  )
