#lang racket
(require racket/contract)

;; 两整数之和
;; https://leetcode-cn.com/problems/sum-of-two-integers/


(define/contract (get-sum a b)
  (-> exact-integer? exact-integer? exact-integer?)
  (if (= b 0)
      (if (< a #x80000000) a                                                    ;; 正数直接返回
          (- (add1 (bitwise-and (bitwise-not a) #xffffffff))))                  ;; 负数需要还原补码
      (let ([sum (bitwise-and (bitwise-xor a b) #xffffffff)]                    ;; a ^ b
            [carry (bitwise-and (arithmetic-shift (bitwise-and a b) 1)          ;; (a & b) << 1
                                #xffffffff)])
        (get-sum sum carry)))
  )
