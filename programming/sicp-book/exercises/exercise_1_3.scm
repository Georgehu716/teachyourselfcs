;; Exercise 1.3: Define a procedure that takes three numbers as arguments
;; and returns the sum of the squares of the two larger numbers.

;; v0
(define (square x)
  (* x x))

(define (sum-of-square a b)
  (+ (square a) (square b)))
 
(define (larger-sum-of-square a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-square b c))
        ((and (<= b a) (<= b c)) (sum-of-square a c))
	;; ((and (<= c a) (<= c b)) (sum-of-square a b))))
	(else (sum-of-square a b))))
  

(larger-sum-of-square 1 2 3)
(larger-sum-of-square 1 1 1)
(larger-sum-of-square 1 2 2)
(larger-sum-of-square 1 1 2)
(larger-sum-of-square 1 4 3)


;; http://community.schemewiki.org/?sicp-ex-1.3

;; v1
(define (sum_of_square a b)
  (+ (* a a) (* b b)))
 
(define (bigger_two a b)
  (if (> a b)
      a
      b))

(define (sum_of_largest_two_squared a b c)
  (if (> a b)
      (sum_of_square a (bigger_two b c))
      (sum_of_square b (bigger_two a c))))

(sum_of_largest_two_squared 1 2 3) 
(sum_of_largest_two_squared 1 1 1)
(sum_of_largest_two_squared 1 2 2)
(sum_of_largest_two_squared 1 1 2)
(sum_of_largest_two_squared 1 4 3)


;; v2
(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-two-largest x y z)
  (sum-of-squares (max x y) (max (min x y) z)))

(sum-of-squares-two-largest 1 2 3) 
(sum-of-squares-two-largest 1 1 1)
(sum-of-squares-two-largest 1 2 2)
(sum-of-squares-two-largest 1 1 2)
(sum-of-squares-two-largest 1 4 3)


;; v3
(define (sum-square-large papa mama baby)
  (define (square x) (* x x))
  (cond ((> mama papa) (sum-square-large mama papa baby))
        ((> baby mama) (sum-square-large papa baby mama))
	(else (+ (square papa) (square mama)))))

(sum-square-large 1 2 3) 
(sum-square-large 1 1 1)
(sum-square-large 1 2 2)
(sum-square-large 1 1 2)
(sum-square-large 1 4 3)


(define (sum-square-largest x y z)
  (cond
    ;; x is smallest
    ((and (< x y) (< x z)) (+ (* y y) (* z z)))
    (else (sum-square-largest y z x))))

(define (sls x y z)
  (cond ((> z x) (sls z y x))
        ((> z y) (sls x z y))
	(else (+ (* x x) (* y y)))))
