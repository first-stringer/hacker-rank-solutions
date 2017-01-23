#lang racket

(define (print-hello-world-multiple-times number)
  (when (> number 0) 
    (displayln "Hello World")
    (print-hello-world-multiple-times (- number 1))
    )
  )

(print-hello-world-multiple-times (string->number (read-line)))
