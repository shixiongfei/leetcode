#lang racket
(require racket/contract)

;; 有效数字
;; https://leetcode-cn.com/problems/valid-number/description/


(define (in-list? elem lst)
  (if (null? (filter (lambda (x) (eq? elem x)) lst)) #f #t))


(define (chksym ch)
    (let ([sym-type
            (cond [(and (char>=? ch #\0)
                        (char<=? ch #\9)) 'type-number]
                  [(char=? ch #\.) 'type-point]
                  [(or (char=? ch #\-)
                       (char=? ch #\+)) 'type-sign]
                  [(or (char=? ch #\e)
                       (char=? ch #\E)) 'type-exponent]
                  [else 'type-other])]
          [retval (make-hash)])
    (begin
      (hash-set! retval 'type sym-type)
      (hash-set! retval 'is-num (eq? sym-type 'type-number))
      (hash-set! retval 'is-exp (eq? sym-type 'type-exponent))
      (hash-set! retval 'is-sign (eq? sym-type 'type-sign))
      (hash-set! retval 'is-point (eq? sym-type 'type-point))
      (hash-set! retval 'is-other (eq? sym-type 'type-other))
      retval)))


(define (string-trim string char)
  (define (trim-left xs item)
    (cond [(null? xs) xs]
          [(eqv? (car xs) item) (trim-left (cdr xs) item)]
          [else xs]))

  (define (trim-right xs item)
    (reverse (trim-left (reverse xs) item)))

  (define (string-trim-left string char)
    (let ([xs (string->list string)])
      (list->string (trim-left xs char))))

  (define (string-trim-right string char)
    (let ([xs (string->list string)])
      (list->string (trim-right xs char))))

  (string-trim-left (string-trim-right string char) char))


(define/contract (is-number s)
  (-> string? boolean?)
  (define (inner-iter str allow-sym ncnt dcnt has-exp has-point)
    (let ([ach (car str)]
          [dch (cdr str)]
          [next-sym (list 'type-number)])
      (if (or (not (char? ach))
              (char=? ach #\null))
          #f
          (let ([chk (chksym ach)])
            (cond
             [(hash-ref chk 'is-other #f) #f]
             [(not (in-list? (hash-ref chk 'type '()) allow-sym)) #f]
             [else
              (begin
                (when (hash-ref chk 'is-num #f)
                  (begin
                    (set! ncnt (+ ncnt 1))
                    (when has-point
                      (set! dcnt (+ dcnt 1)))))
                (cond
                 [(and (not has-exp)
                       (hash-ref chk 'is-exp #f)
                       (and has-point                                           ; 指数后面不允许有小数点
                            (= ncnt 0)
                            (= dcnt 0)))
                  #f]
                 [(and (not has-point)
                       (hash-ref chk 'is-point #f)
                       has-exp)                                                 ; 小数点之前不能有指数符号
                  #f]
                 [(and has-exp (hash-ref chk 'is-exp #f))                       ; 不允许多个指数符号
                  #f]
                 [else
                  (begin
                    (when (and (not has-exp)
                               (hash-ref chk 'is-exp #f))
                      (begin
                        (set! has-exp #t)
                        (set! next-sym (cons 'type-sign next-sym))              ; 指数后面一位允许正负号
                        (set! ncnt 0)                                           ; 重新统计指数后面的数字个数
                        (when (not has-point)                                   ; 没有指数符号和小数点的时候，后面一个字符允许有指数符号
                          (set! next-sym (cons 'type-exponent next-sym)))))
                    (when (not has-point)
                      (if (hash-ref chk 'is-point #f)
                          (begin
                            (set! has-point #t)
                            (set! next-sym (cons 'type-exponent next-sym)))     ; 小数点后面允许指数符号
                          (begin
                            (set! next-sym (cons 'type-point next-sym))
                            (when (not has-exp)
                              (set! next-sym (cons 'type-exponent next-sym))))))
                    (when (and has-point
                               (not has-exp))
                      (set! next-sym (cons 'type-exponent next-sym)))
                    (cond
                     [(not (null? dch))
                      (inner-iter dch next-sym ncnt dcnt has-exp has-point)]
                     [(= ncnt 0) #f]
                     [else #t]))]))])))))

  (let* ([tmp (string-trim s #\space)]
         [str (string->list tmp)]
         [strlen (string-length tmp)])
    (cond
      [(= strlen 0) #f]
      [(and (> strlen 1)
            (hash-ref (chksym (car str)) 'is-sign #f)
            (hash-ref (chksym (cadr str)) 'is-exp #f))
       #f]
      [else (inner-iter str
                        (list 'type-number 'type-sign 'type-point)
                        0 0 #f #f)])))
