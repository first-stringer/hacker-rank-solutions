#lang racket

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

