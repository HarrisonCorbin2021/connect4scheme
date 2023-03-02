(define (square x)
    (* x x)
)

(display (map (lambda (x) (* x x)) '(5 10 15 20)))

(define (("George" "Washington") ("John" "Adams")) names)

(map (lambda (pair) () ) names)

(display (map (lambda (pair)
    (format "\"~a, ~a"\" (cdr pair) (cdr pair)))
    names    
))
(newline)

(define (my-select) lst
    (if (null? lst)
        '()
        (if (> (car lst) 0)
            (cons (car lst) (my-select (cdr lst)))
            (my-select (cdr lst))
        )
    )
)
(display (my-select '(1 4 5 -9 -8 -5 3 4 3 -1)))