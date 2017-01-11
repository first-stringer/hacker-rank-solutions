#lang racket

;; https://www.hackerrank.com/challenges/plus-minus

;; I used a structure as a convenient way to return all three counts so that I can recursively process the 
;; entire list in one pass while reading it in.

(define-struct counts (p n z) #:transparent)

(define (plus-minus-zero n tc)
  (if (= n 0)
    tc
    (let ([x (read)])
      (cond
	[(> x 0) (plus-minus-zero (- n 1) (make-counts (+ 1 (counts-p tc)) (counts-n tc) (counts-z tc)))]
	[(< x 0) (plus-minus-zero (- n 1) (make-counts (counts-p tc) (+ 1 (counts-n tc)) (counts-z tc)))]
	[else (plus-minus-zero (- n 1) (make-counts (counts-p tc) (counts-n tc) (+ 1 (counts-z tc))))]
	)
      )
    )
  )

(define (round-to-n-digits x n)
  (let ([y (expt 10 n)])
    (/ (floor (* x y)) y)
    )
  )

(let* ([n (read)] 
       [tc (plus-minus-zero n (make-counts 0 0 0))]
       )
  (fprintf (current-output-port) "~a~n" (round-to-n-digits (exact->inexact (/ (counts-p tc) n)) 6))
  (fprintf (current-output-port) "~a~n" (round-to-n-digits (exact->inexact (/ (counts-n tc) n)) 6))
  (fprintf (current-output-port) "~a~n" (round-to-n-digits (exact->inexact (/ (counts-z tc) n)) 6))
  )

