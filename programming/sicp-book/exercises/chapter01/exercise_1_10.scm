;; Exercise 1.10. The following procedure computes a mathematical function called Ackermann's function
;; https://en.wikipedia.org/wiki/Ackermann_function


(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


(A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 (A 1 8)
;; ...
;; (A 0 (A 0 (A 0 ...  (A 1 1)
;; 2 * 2 * 2 * 2 * 2 ... * 2


(A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (A 0 2)))
;; (A 1 (A 1 4))
;; (A 1 (A 0 (A 1 3)))
;; (A 1 (A 0 (A 0 (A 1 2))))
;; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;; (A 1 (A 0 (A 0 (A 0 2))))
;; (A 1 (A 0 (A 0 4)))
;; (A 1 (A 0 8))
;; (A 1 16)
;; 65536


(A 3 3)


;; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n)) ; f(n) = 2 * n
(define (g n) (A 1 n)) ; g(n) = 2 ^ n
(define (h n) (A 2 n)) ; h(n) = 2 ^ (2 ^ n)
(define (k n) (* 5 n n))

(f 3)
(g 3)
(h 3)
(h 4)


;; Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5*n^2.
