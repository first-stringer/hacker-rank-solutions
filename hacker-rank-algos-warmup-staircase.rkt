#lang racket 

;; https://www.hackerrank.com/challenges/staircase

(define (print-staircase n r c)
  (when (<= r n) 
    (cond 
      [(<= c (- n r)) 
	(fprintf (current-output-port) " ") 
	(print-staircase n r (+ c 1))
       ]
      [(= c (+ n 1))
       (fprintf (current-output-port) "~n") 
       (print-staircase n (+ r 1) 1)
       ]
      [else
	(fprintf (current-output-port) "#") 
	(print-staircase n r (+ c 1))
	]
      )
    )
  )

(print-staircase (read) 1 1)

