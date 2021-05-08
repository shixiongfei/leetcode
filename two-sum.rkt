#lang racket
(require racket/contract)

;; 两数之和
;; https://leetcode-cn.com/problems/two-sum/description/


(define/contract (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define (inner-iter hashes nums index)
    (if (null? nums)
        '(-1 -1)
        (let ((head (car nums))
              (tail (cdr nums)))
          (if (hash-has-key? hashes head)
              (list (hash-ref hashes head '()) index)
              (begin
                (hash-set! hashes (- target head) index)
                (inner-iter hashes tail (+ index 1)))))))
  (inner-iter (make-hash) nums 0)
  )
