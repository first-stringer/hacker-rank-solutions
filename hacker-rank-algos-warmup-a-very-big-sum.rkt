#lang racket

;; https://www.hackerrank.com/challenges/a-very-big-sum

;; Sums the numbers recursively while reading them.

(define (add-number n sum)
  (if (> n 0) 
    (add-number (- n 1) (+ sum (read)))
    sum
    )
  )

(add-number (read) 0)

