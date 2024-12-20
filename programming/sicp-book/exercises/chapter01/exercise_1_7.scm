;; Exercise 1.7. The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers.
;; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers.
;; Explain these statements, with examples showing how the test fails for small and large numbers.
;; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess.
;; Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


;; why fails for small and large numbers?
;; 
;; For small number:
;; If the square root of x is less than 0.001 in good-enough?, it is always be true to compare abs of square guess and x. The algorithm doesn't work for small number.
;;
;; For large number:
;; If the square root of x is a large number, due to the limited precision of arithmetic operations, the difference between and square guess and x is not effective to the 0.001 in good-enough?.
;; 
;; better good-enough? compare the diff between previous guess and current guess. Does this work better for small and large numbers?
;;
;; For small and large numbers:
;; It will compare the changes between prev-guess and current guess, no matter how large or small of the square root.


(define (sqrt x)
  (sqrt-iter 0 1.0 x))

(define (sqrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess x)
      guess
      (sqrt-iter guess (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? prev-guess guess x)
  (< (abs (- prev-guess guess)) 0.001))


(sqrt 9)
(sqrt 25)
(square (sqrt 1000000000))
(square (sqrt 0.000001))
