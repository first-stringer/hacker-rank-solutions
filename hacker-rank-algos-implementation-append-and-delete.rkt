#lang racket

(define s1st (string->list (read-line)))
(define s2st (string->list (read-line)))
(define k (string->number (read-line)))

(define (number-of-common-chars s1st s2st)
  (if (or (empty? s1st) (empty? s2st) (not (eq? (car s1st) (car s2st)))) 
    0
    (add1 (number-of-common-chars (cdr s1st) (cdr s2st)))
    )
  )

(define prefix-length (number-of-common-chars s1st s2st))
(define s1st-after-prefix (- (length s1st) prefix-length))
(define s2st-after-prefix (- (length s2st) prefix-length))
(define min-moves-required (+ s1st-after-prefix s2st-after-prefix))

(cond 
  [(> min-moves-required k) (displayln "No")]
  [(even? (- k min-moves-required)) (displayln "Yes")]
  [(> (+ 1 prefix-length min-moves-required) k) (display "No")]
  [else (displayln "Yes")]
  )

