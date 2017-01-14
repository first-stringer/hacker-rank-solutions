#lang racket

;; https://www.hackerrank.com/challenges/apple-and-orange

(define s (read))
(define t (read))
(define a (read))
(define b (read))
(define m (read))
(define n (read))

(define (read-positions n)
  (if (= n 0)
    '() 
    (cons (read) (read-positions (- n 1)))
    )
  )

(define as (read-positions m))
(define bs (read-positions n))

(define (count-fruit s t a as sum)
  (if (empty? as)
    sum
    (let ([an (+ a (car as))])
      (if (and (>= an s) (<= an t) )
	(count-fruit s t a (cdr as) (+ sum 1))
	(count-fruit s t a (cdr as) sum)
	)
      )
    )
  )

(displayln (count-fruit s t a as 0))
(displayln (count-fruit s t b bs 0))

