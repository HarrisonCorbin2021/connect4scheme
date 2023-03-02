(define (int-to-string i) (format "~a" i))

(define (int-list-to-string lst)
    ; use string-append
    (fold
        (lambda (item partial)
           (string-append partial (int-to-string item))
        )
        ""
        lst
    )
)