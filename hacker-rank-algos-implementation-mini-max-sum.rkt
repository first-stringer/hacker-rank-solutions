#lang racket

(define lst (cons (read) (cons (read) (cons (read) (cons (read) (cons (read) '()))))))

(define sorted-lst (sort lst <))

(define mini (for/sum ([i (drop-right sorted-lst 1)]) i))
(define maxi (for/sum ([i (cdr sorted-lst)]) i))

(fprintf (current-output-port) "~a ~a~n" mini maxi)
