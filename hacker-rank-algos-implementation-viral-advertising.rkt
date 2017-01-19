#lang racket

(define (sum-ad-likers i m n)
  (if (> i n)
    0
    (+ (floor (/ m 2)) (sum-ad-likers (add1 i) (* (floor (/ m 2)) 3) n))
    )
  )

(displayln (sum-ad-likers 1 5 (read)))

