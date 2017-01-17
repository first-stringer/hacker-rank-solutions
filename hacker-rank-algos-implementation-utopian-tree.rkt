#lang racket

;; https://www.hackerrank.com/challenges/utopian-tree

(define (get-height n)
  (if (= n 0)
    1
    (if (odd? n)
      (* 2 (get-height (sub1 n)))
      (add1 (get-height (sub1 n)))
      )
    ) 
  )

;; begin provided code
(define (get-list T)
  (if (= T 0)
    (list)
    (cons (read) (get-list (- T 1)))))

(let ([lst (get-list (read))])
  (let ([ans (map get-height lst)])
    (for ([val ans])
      (printf "~a~%" val))))
;; end provided code

