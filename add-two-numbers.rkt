#lang racket
(require racket/contract)

;; 两数相加
;; https://leetcode-cn.com/problems/add-two-numbers/description/


; val : integer?
; next : (or/c list-node? #f)
(struct list-node
  (val next) #:mutable #:transparent)


; constructor
(define (make-list-node [val 0])
  (list-node val #f))


(define (reverse-list l)
  (define (inner-iter head current pre)
    (if (not current)
        head
        (let ([next (list-node-next current)])
          (set-list-node-next! current pre)
          (inner-iter current next current))
        ))
  (inner-iter l l #f))


(define/contract (add-two-numbers l1 l2)
  (-> (or/c list-node? #f) (or/c list-node? #f) (or/c list-node? #f))
  (define (inner-iter total carry l1 l2)
    (if (and (= carry 0)
             (not l1)
             (not l2))
        (reverse-list total)
        (let* ([n1 (if l1 (list-node-val l1) 0)]
               [n2 (if l2 (list-node-val l2) 0)]
               [s (+ n1 n2 carry)]
               [x (make-list-node (modulo s 10))])
          (set-list-node-next! x total)
          (inner-iter x
                      (quotient s 10)
                      (if l1 (list-node-next l1) #f)
                      (if l2 (list-node-next l2) #f)))
        ))
  (inner-iter #f 0 l1 l2))
