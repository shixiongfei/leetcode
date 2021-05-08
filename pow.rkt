#lang racket
(require racket/contract)

;; Pow(x, n)
;; https://leetcode-cn.com/problems/powx-n/description


(define/contract (my-pow x n)
  (-> flonum? exact-integer? flonum?)
  (define (inner-iter x n accum)
    (cond
      [(< n 0) (inner-iter (/ 1 x) (- n) 1.0)]
      [(= n 0) accum]
      [(= (modulo n 2) 0) (inner-iter (* x x) (/ n 2) accum)]
      [else (inner-iter x (- n 1) (* accum x))]))
  (inner-iter x n 1.0)
  )
