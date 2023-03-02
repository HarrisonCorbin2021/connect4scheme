(define (log_2 x)
    (if (= x 1) 
        0
        (+ 1 (log_2(truncate-quotient x 2)))
    )
)

(display (format "Log_2 of ~a is ~a\n" 8 (log_2 8)))

(define (count-up x y)
(display (format "~a\n" x))
    (if (= x y)
        (newline)
        (count-up (+ x 1) y)
    )     
)

(define (draw-blank width)
    (if (= width 1)
        (newline)
        (draw-line (- width 1))
    )
)

(define (draw-line width)
    (display "*")
    (if (= width 1)
        (newline)
        (draw-line (- width 1))
    )
)

(define (rectangle width height)
    (draw-line width)
    (if (= height 1)
        ()
        (draw-line width)
        (rectangle width (- height 1))
    )
  
)

(rectangle 10 5)