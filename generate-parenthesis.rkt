#lang racket
(require racket/contract)

;; 括号生成
;; https://leetcode-cn.com/problems/generate-parentheses/description


(define/contract (generate-parenthesis n)
  (-> exact-integer? (listof string?))
  (define res (list))

  (let recur ([cur ""]
              [left n]
              [right n])
    (if (= left right 0)
        (set! res (append res (list cur)))
        (begin
          (when (> left 0)
            (recur (string-append cur "(") (- left 1) right))

          (when (< left right)
            (recur (string-append cur ")") left (- right 1))))
        ))

  res
  )
