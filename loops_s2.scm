(define (print-row-helper width char)
	(display char)
	(if (= width 1)
		()
		(print-row-helper (- width 1) char)
	)
)

(define (print-row width)
	(print-row-helper width "*")
	(newline)
)

(define (print-hollow-row width)
	(display "* ")
	(print-row-helper (- width 2) " ")
	(display "*")
	(newline)
)

(define (rectangle width height)
	(print-row width)
	(if (= height 1)
	()
	(rectangle (- width 1))
)

(define (hollow-rectangle-helper width height iter)
	(cond
		((= iter 0) (print-row width))
		((= iter (- height 1) (print-row width))
		(else (print-hollow-row width)
	)
	( if (< iter (- height 1)) (hollow-rectangle-helper width height (+ iter 1)) ())	
)

(define (hollow-rectangle2-helper width height)
    (print-hollow-row width)
    (if (> height 1) (hollow-rectangle2-helper width (- height 1)) ())
    (print-hollow-row width)
)

(define (hollow-rectangle2 width height)
    (print-row height)
    (hollow-rectangle2-helper width (- height 2))
    (print-row height)
)