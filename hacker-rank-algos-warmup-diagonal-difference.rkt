#lang racket

;; https://www.hackerrank.com/challenges/a-very-big-sum

#| 
This solution looks overly complex.  I designed it to process the matrix of positions as I read each position.  
I did this to avoid creating a large 2D array in memory and to avoid processing every position twice. 
First I create the list of positions I am interested in and classify each one as l for left or r for right.
Then I read in the matrix positions and check each one against my list.  If the position is in the list of positions 
I am interested in, I add it to a new list if it's left and I add it's negative to the new list if it's right.  I 
ignore the center position in odd size matrices.  I also have to sort the list of positions I am interested in after I
create it so that it matches the order I read the matrix positions in.
|#

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

