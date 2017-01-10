#lang racket

;; https://www.hackerrank.com/challenges/a-very-big-sum

(define-struct e (val side) #:transparent)

(define (generate-positions-list-helper n r)
  (if (= r n)
    (cons (make-e (+ (* n (- r 1)) r) 'l) (cons (make-e (- (* n r) (- r 1)) 'r) '()))
    (cons (make-e (+ (* n (- r 1)) r) 'l) (cons (make-e (- (* n r) (- r 1)) 'r) (generate-positions-list-helper n (+ r 1))))
    )
  )

(define (process-matrix n cp posns)
  (if (<= cp (* n n))
    (let* ([cv (read)]
	   [np (car posns)]) 
      (cond 
	[(and (odd? n) (= cp (+ 1 (quotient (* n n) 2)))) (process-matrix n (+ cp 1) (cdr (cdr posns)))] ; center of an odd matrix
	[(and (= cp (e-val np)) (eq? (e-side np) 'l)) (+ cv (process-matrix n (+ cp 1) (cdr posns)))] 
	[(and (= cp (e-val np)) (eq? (e-side np) 'r)) (+ (* cv -1) (process-matrix n (+ cp 1) (cdr posns)))] 
	[else (process-matrix n (+ cp 1) posns)] 
	)
      )
    0
    )
  )

(define (generate-positions-list n) 
  (generate-positions-list-helper n 1)
  )

(abs (let ([n (read)]) (process-matrix n 1 (sort (generate-positions-list n) (lambda (x y) (< (e-val x) (e-val y)))))))

