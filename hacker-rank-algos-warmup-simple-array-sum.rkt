#lang racket

;; <a href=“https://www.hackerrank.com/challenges/simple-array-sum">
;;[I'm an inline-style link with title](https://www.google.com "Google's Homepage")

(define (simple-array-sum n sum)
  (if (> n 0)
    (simple-array-sum (- n 1) (+ sum (read)))
    sum
    )
  )

(simple-array-sum (string->number (read-line)) 0)
