#lang racket

(define (my-factorial x)
  (if (= x 0)
    1
    (* x (my-factorial (sub1 x)))
    )
  )

(my-factorial (read))

