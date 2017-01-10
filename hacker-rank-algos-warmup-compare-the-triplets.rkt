#lang racket

;; https://www.hackerrank.com/challenges/solve-me-first

;; Reads first line into list.  Recursively computes sum while reading the second line.
;; Runtime is 2N.

(define-struct score (p1 p2))

(define (compute-score x y)
  (cond
    [(= x y) (make-score 0 0)]
    [(> x y) (make-score 1 0)]
    [else (make-score 0 1)]
    )
  )

(define (sum-scores s1 s2) 
  (make-score (+ (score-p1 s1) (score-p1 s2)) (+ (score-p2 s1) (score-p2 s2)))
  )

(define (process-second-line lst)
  (if (= (length lst) 1)
    (compute-score (car lst) (read))
    (sum-scores (compute-score (car lst) (read)) (process-second-line (cdr lst)))
    )
  )

(define (get-first-line)
  (cons (read) (cons (read) (cons (read) '())))
  )

(let ([total-score (process-second-line (get-first-line))])
  (fprintf (current-output-port) "~a ~a~n" (score-p1 total-score) (score-p2 total-score))
  )

