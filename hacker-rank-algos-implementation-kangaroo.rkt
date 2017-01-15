#lang racket

;; https://www.hackerrank.com/challenges/kangaroo

(define (check-positions x1 v1 x2 v2)
  (cond
    [(= x1 x2) "YES"]
    [(and (> x1 x2) (>= v1 v2)) "NO"]
    [(and (> x2 x1) (>= v2 v1)) "NO"]
    [else (check-positions (+ x1 v1) v1 (+ x2 v2) v2)]
    )
  )

(define x1 (read))
(define v1 (read))
(define x2 (read))
(define v2 (read))

(displayln (check-positions (+ x1 v1) v1 (+ x2 v2) v2))

