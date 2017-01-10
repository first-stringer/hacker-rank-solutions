#lang racket

(define (simple-array-sum n sum)
  (if (> n 0)
    (simple-array-sum (- n 1) (+ sum (read)))
    sum
    )
  )

(simple-array-sum (string->number (read-line)) 0)
