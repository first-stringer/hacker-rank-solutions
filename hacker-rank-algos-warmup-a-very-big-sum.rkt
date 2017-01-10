#lang racket

(define (add-number n sum)
  (if (> n 0) 
    (add-number (- n 1) (+ sum (read)))
    sum
    )
  )

(add-number (read) 0)
