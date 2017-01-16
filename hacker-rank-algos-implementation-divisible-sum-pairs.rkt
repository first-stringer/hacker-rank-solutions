#lang racket

(define n (read))
(define k (read))

(define (read-list n)
  (if (= n 0)
    '()
    (cons (read) (read-list (sub1 n)))
    )
  )

(define lst (read-list n))

(define (first-posn-pair x lst k)
  (cond
    [(empty? lst) 0]
    [(= (remainder (+ x (car lst)) k) 0) (add1 (first-posn-pair x (cdr lst) k))]
    [else (first-posn-pair x (cdr lst) k)]
    )
  )

(define (all-posn-pair lst k)
  (if (= (length lst) 1)
    0
    (+ (first-posn-pair (car lst) (cdr lst) k) (all-posn-pair (cdr lst) k))
    )
  )

(all-posn-pair lst k)

