(define (length lst)
    (if (null? lst)
        0
        (+ 1 (length (cdr lst)))
    )
)

(display (length '(a b c d e)))
(newline)

(define (count_of lst item)
    (if (null? lst)
    0
    (+ (if (eq? (car lst) item) 1 0) (count_of (cdr lst) item))
    )
)

(define (intsert-at lst item x)
    (if(= x 0)
        (cons item lst)
        (cons (car lst) (inter-at (cdr lst) item (- x 1)))
    )
)

(read-line)
(string-to-int)

(define (replace-at lst item x)
    (if(= x 0)
        (cons item (cdr lst))
        (cons (car lst) (replace-at (cdr lst) (- x 1) item))
    )
)

(define (reverse lst)
    (if (?null lst)
        lst
        (append (reverse (cdr lst)) (cons (car lst)'()))
    )
)

(define (reverse2 lst)
    (define (reverse-helper lst partial)
        if(null? lst)
        partial(reverse-helper (cdr lst) (cons (car lst) partial))   
    )
    (reverse-helper lst '())
)
(display (reverse2 '(q r s t u v)))

(define (my-append a b)
    (if(null? b)
        a
        (append a (car b))
    )
)