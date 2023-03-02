(define (bound high low lst)
    (map(lambda (x)
        (cond ((> x high)high)
            ((< x low)low)
            (else x)
        ))
    lst
    )
)

(require 'list-lib)
(display
    (fold (lambda (item partial) (+ item partial)) 0 '(1 2 3 4 5))
)
(newline)

(define lst3 '(8 6 7 5 3 0 9))
(display
    (fold (lambda (item partial) (if (> item partial) item partial)) (car lst) lst3)
)
(newline)

(display
    (reduce (lambda (item partial) (if (> item partial) item partial)) 'empty_list' '())
)
(newline)

(define (map-by-index action max)
    (reverse (if (= max 0)
        '()
        (append (map-by-index action (- max 1)) (list (action (- max 1))))
    )
)

(display
    (map-by-index (lambda (x) (* x 2)) 5)
)
(newline)

(define (list-ref (list-ref board x) x))


(define (contains value lst)
    (fold 
        (lambda (item partial) )
            (or (eq? value item) partial)
        )
        #f
        lst
    )
)
(display (contains 'd '(a b c d e f g)))