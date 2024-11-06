(define (square x)
	(* x x))

(square 3)
(square (+ 1 2))
(square (square 3))


(define (sum-of-square x y)
	(+ (square x) (square y)))

(sum-of-square 3 4)


(define (f a)
	(sum-of-square (+ a 1) (* a 2)))

(f 5)
