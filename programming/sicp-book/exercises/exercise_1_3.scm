(define (square x)
  (* x x))

(define (sum-of-square a b)
  (+ (square a) (square b)))
 
(define (larger-sum-of-square a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-square b c))
        ((and (<= b a) (<= b c)) (sum-of-square a c))
	((and (<= c a) (<= c b)) (sum-of-square a b))))
  

(larger-sum-of-square 1 2 3)
(larger-sum-of-square 2 2 2)
(larger-sum-of-square 1 1 1)
(larger-sum-of-square 1 2 2)
(larger-sum-of-square 1 1 2)
(larger-sum-of-square 1 4 3)
