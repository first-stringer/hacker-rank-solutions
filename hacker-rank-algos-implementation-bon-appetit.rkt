#lang racket

(define n (read))
(define k (read))

(define (read-list n)
  (if (= n 0)
    '()
    (cons (read) (read-list (sub1 n)))
    )
  )

(define prices (read-list n))

(define bill (read))

(define half-total (/ (for/sum ([i prices]) i) 2))

(if (= bill half-total)
  (displayln (/ (list-ref prices k) 2))
  (displayln "Bon Appetit")
  )

