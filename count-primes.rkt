#lang racket
(require racket/contract)

;; 计数质数
;; https://leetcode-cn.com/problems/count-primes/description


(define/contract (count-primes n)
  (-> exact-integer? exact-integer?)
  (define primes (make-vector (add1 n) #t))
  (vector-set! primes n #f)

  (for/fold ([count 0])
            ([step (in-range 2 (add1 n))])
    (if (vector-ref primes step)
        (begin0
            (add1 count)
          (for ([i (in-range 2 (add1 (quotient n step)))])
            (vector-set! primes (* step i) #f)))
        count)
    ))
