#lang racket

(define (get-all-input) 
  (let ([line (read-line)]) 
    (if (non-empty-string? line) 
      (cons (string->number line) (get-all-input))
      '()
      )
    )
  )

(define (filter-odd-positions list)
  (if (< (length list) 2) 
    '()
    (cons (car (cdr list)) (filter-odd-positions (cdr (cdr list))))
    )
  )

(for-each println (filter-odd-positions (get-all-input)))

