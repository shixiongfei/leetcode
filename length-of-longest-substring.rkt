#lang racket
(require racket/contract)

;; 无重复字符的最长子串
;; https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/


(define (most fn lst)
  (define (inner-iter rest wins higher)
    (if (null? rest)
        (values wins higher)
        (let ([score (fn (car rest))])
          (if (> score higher)
              (inner-iter (cdr rest) (car rest) score)
              (inner-iter (cdr rest) wins higher)))))
  (if (null? lst)
      (values '() 0)
      (inner-iter (cdr lst) (car lst) (fn (car lst)))))

;;(most length '((a b) (a b c) (a)))


(define (char-in-list? lst ch)
  (if (null? (filter (lambda (x) (char=? ch x)) lst)) #f #t))

;;(char-in-list? (string->list "Apple") #\A)
;;(char-in-list? (string->list "Apple") #\d)


(define/contract (length-of-longest-substring s)
  (-> string? exact-integer?)
  (define (inner-iter lst str)
    (if (or (null? str)
            (char-in-list? lst (car str)))
        (reverse lst)
        (inner-iter
         (cons (car str) lst)
         (cdr str))))
  (define (outer-iter check-list str)
    (if (null? str)
        (let-values ([(wins higher) (most length (reverse check-list))])
          higher)
        (outer-iter
         (cons (inner-iter '() str) check-list)
         (cdr str))))
  (outer-iter '() (string->list s))
  )
