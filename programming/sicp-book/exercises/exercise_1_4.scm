;; Exercise 1.4: Observe that our model of evaluation allows for combinations whose operators are compound expressions.
;; Use this observation to describe the behavior of the following procedure:
;; (define (a-plus-abs-b a b)
;;   ((if (> b 0) + -) a b))


;; This procedure means if b is greater than 0, (a-plus-abs-b) will become (+ a b), if b is less than or equal to 0, (a-plus-abs-b)
;; will become (- a b).


(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 2)
(a-plus-abs-b 1 -2)
