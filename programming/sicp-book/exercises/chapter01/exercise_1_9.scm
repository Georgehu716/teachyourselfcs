;; Exercise 1.9. Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.


(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (add a b)
  (if (= a 0)
      b
      (inc (add (dec a) b))))

(define (add a b)
  (if (= a 0)
      b
      (add (dec a) (inc b))))


(add 4 5)
(add 10 10)


;; The first process is recursive, the second is iterative.
;; The first process deferred the inc operation until a is reduced to 0. It should maintain the deferred operations.
;; The second process is iterative, it only need to maintain the value of variable a and b, it is a tail-recursive, it is iterative.


;; expansion of the first process
(add 4 5)
(inc (add 3 5))
(inc (inc (add 2 5)))
(inc (inc (inc (add 1 5))))
(inc (inc (inc (inc (add 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; expansion of the second process
(add 4 5)
(add 3 6)
(add 2 7)
(add 1 8)
(add 0 9)
9
