(define (square x)
	(* x x))

(square 3)
(square (+ 1 2))
(square (square 3))


(define (sum-of-squares x y)
	(+ (square x) (square y)))

(sum-of-squares 3 4)


(define (f a)
	(sum-of-squares (+ a 1) (* a 2)))

(f 5)
