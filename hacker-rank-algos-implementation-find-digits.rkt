#lang racket

;; https://www.hackerrank.com/challenges/find-digits

(define (process-number n lst)
  (if (empty? lst)
    0
    (let ([x (- (char->integer (car lst)) (char->integer #\0))])  
      (cond
	[(= x 0) (process-number n (cdr lst))]
	[(= (remainder n x) 0) (add1 (process-number n (cdr lst)))]
	[else (process-number n (cdr lst))]
	)
      )
    )
  )

(define (process-input t)
  (when (> t 0)
    (displayln (let ([l (read-line)]) (process-number (string->number l) (string->list l))))
    (process-input (sub1 t))
    )
  )

(process-input (string->number (read-line)))

