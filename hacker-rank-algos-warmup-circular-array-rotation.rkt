#lang racket

;; https://www.hackerrank.com/challenges/circular-array-rotation

;; Solution looks complicated because I designed it to fill in a vector in the 
;; shifted order while reading the input in so as to only process each piece of 
;; data one time.  c is the current position I'm reading in and k is the number 
;; of positions to rotate.

(define (fill-vector n k c v)
  (cond
    [(= c n) v]
    [(>= (+ c k) n) 
     (vector-set! v (- (+ c k) n) (read)) 
     (fill-vector n k (+ c 1) v)
     ]
    [else 
      (vector-set! v (+ c k) (read)) 
      (fill-vector n k (+ c 1) v) 
      ]
    )
  )

(define n (read))
(define k (read))
(define q (read))

(define rotated-array (fill-vector n (remainder k n) 0 (make-vector n)))

(define (return-positions n v)
  (when (> n 0) 
    (displayln (vector-ref v (read)))
    (return-positions (- n 1) v)
    )
  )

(return-positions q rotated-array)

