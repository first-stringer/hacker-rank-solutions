#lang racket

;; https://www.hackerrank.com/challenges/designer-pdf-viewer 

(define (read-heights n)
  (if (> n 0)
    (cons (read) (read-heights (- n 1)))
    (begin 
      (read-byte)
      '() 
      )
    )
  )

(define heights (read-heights 26))

(define (read-word)
  (let ([w (read-char)])
    (if (char-whitespace? w)
      '()
      (cons w (read-word))
      )
    )
  )

(define word (string->list (read-line)))

(define (find-tallest word t) 
  (if (empty? word) 
    t
    (let ([nt (list-ref heights (- (char->integer (car word)) (char->integer #\a)))])
      (if (> nt t) 
	(find-tallest (cdr word) nt)
	(find-tallest (cdr word) t)
	)
      )
    )
  )

(displayln (* (find-tallest word 0) (length word)))

