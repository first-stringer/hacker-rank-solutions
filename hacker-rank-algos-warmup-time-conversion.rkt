#lang racket

(let ([hh (+ (* (- (read-byte) 48) 10) (- (read-byte) 48))])
  (read-char)
  (let ([mm (+ (* (- (read-byte) 48) 10) (- (read-byte) 48))])
    (read-char)
    (let ([ss (+ (* (- (read-byte) 48) 10) (- (read-byte) 48))]
	  [pora (read-char)])
      (cond
	[(and (eq? pora #\P) (< hh 12)) (display (~a (+ 12 hh) #:width 2 #:align 'right #:pad-string "0"))]
	[(and (eq? pora #\A) (= hh 12)) (display (~a 0 #:width 2 #:align 'right #:pad-string "0"))]
	[else (display (~a hh #:width 2 #:align 'right #:pad-string "0"))]
	)
      (display ":")
      (display (~a mm #:width 2 #:align 'right #:pad-string "0"))
      (display ":")
      (displayln (~a ss #:width 2 #:align 'right #:pad-string "0"))
      )
    )
  )

