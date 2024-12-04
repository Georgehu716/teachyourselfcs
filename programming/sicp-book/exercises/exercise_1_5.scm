;; Exercise 1.5. Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
;; 
;; (define (p) (p))
;;
;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y))
;;
;; Then he evaluates the expression
;; 
;; (test 0 (p))
;;
;; What behavior will Ben observe with an interpreter that uses appliative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation?
;; Explain your answer. (Assume that the evaluation rule for the special form `if` is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)


;; Applicative-order evaluation
;; evaluate the arguments and then apply
;;
;; So, first it will evaluate `(p)`, and it return a p, it is a infinite loop.


;; Normal-order evaluation
;; fully expand and then reduce
;;
;; So, (test 0 (p)) will become (if (= 0 0) 0 (p)), it will return 0.
