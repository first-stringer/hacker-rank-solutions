#lang racket

(define n (read))
(define k (read))

(define (read-list n)
  (if (= n 0)
    '()
    (cons (read) (read-list (sub1 n)))
    )
  )

(define (process-input k cs)
  (if (empty? cs)
    0
    (let* ([c (car cs)]
	   [ncs (list-tail cs k)]
	   )
      (if (= c 0)
	(+ 1 (process-input k (list-tail cs k)))
	(+ 3 (process-input k (list-tail cs k)))
	)
      )
    )
  )

(- 100 (process-input k (read-list n)))

