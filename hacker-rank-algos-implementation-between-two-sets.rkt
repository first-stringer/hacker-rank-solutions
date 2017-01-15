#lang racket

(define n (read))
(define m (read))

(define (input-row n)
  (if (= n 0)
    '()
    (cons (read) (input-row (- n 1)))
    )
  )

(define as (input-row n))
(define bs (input-row m))

(define (common-elements lst1 lst2)
  (cond
    [(or (empty? lst1) (empty? lst2)) '()]
    [(= (car lst1) (car lst2)) (cons (car lst1) (common-elements (cdr lst1) (cdr lst2)))]
    [(> (car lst1) (car lst2)) (common-elements lst1 (cdr lst2))]
    [else (common-elements (cdr lst1) lst2)]
    )
  )

(define (my-divisors-helper x n) 
  (let-values ([(q r) (quotient/remainder x n)]) 
    (cond 
      [(= q n) (cons q '())]
      [(= r 0) (cons n (cons q (my-divisors-helper x (add1 n))))]
      [(< n q) (my-divisors-helper x (add1 n))]
      [else '()]
      )
    )
  )

(define (my-divisors x) 
  (sort (my-divisors-helper x 1) <)
  )

(define (all-divisors lst)
  (if (= (length lst) 1)
    (my-divisors (car lst)) 
    (common-elements (my-divisors (car lst)) (all-divisors (cdr lst)))
    )
  )

(define (factor? x y)
  (= (remainder x y) 0)
  )

(define (filter-factors-of a bs)
  (cond 
    [(empty? bs) '()]
    [(factor? (car bs) a) (cons (car bs) (filter-factors-of a (cdr bs)))]
    [else (filter-factors-of a (cdr bs))]
    )
  )

(define (get-betweeners as bs)
  (if (= (length as) 1)
    (filter-factors-of (car as) bs)
    (common-elements (filter-factors-of (car as) bs) (get-betweeners (cdr as) bs))
    )
  )

(length (get-betweeners as (all-divisors bs)))

