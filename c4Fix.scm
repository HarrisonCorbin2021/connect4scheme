
;Build a new board
(define (build-board num_rows num_columns)
    (if (= num_rows 0)
        (build-list num_columns "x")
        (cons (build-list num_columns "x") (build-board (- num_rows 1) num_columns))
    )  
)

;Builds a row within a new board
(define (build-list size item)
  (if (= 1 size)
     (list item)                      
     (cons item (build-list (- size 1) item))
  )
)

;Print the board
(define (print-row board row)
    (display (list-ref board row))
    (newline)
    (if (= row 0)
        (newline)
        (print-row board (- row 1))
    )  
)

;Update the board
(define (update-list index value lst)
    (if(= index 0)
        (cons value (cdr lst))
        (cons (car lst) (update-list (- index 1) value (cdr lst)))
    )
)

;Replaces the old list with the updated list into the board
(define (update-board board x y)
    (if (= y 0)
        (cons (update-list x "O" (list-ref board y)) (cdr board)) 
        (cons (car board) (update-board (cdr board) x (- y 1)))
    )
)

;Player's turn
(define (player-turn board player_n)
    (input-loop (read-line))
   ; (display "All good!")
)

(define (input-loop in)
   (or (> in 0) (< in 5)
       (display "Not a valid input") (input-loop (string-to-int (read-line)))
   )
)

(define (string-to-int s)
    (- (char->integer (string-ref s 0)) 97)
)

;(display "hello world")
;(update-list 5 "O" (list-ref (build-board 6 7) 0)) 0)
;(display (print-row (build-board 6 7) 5))
;(print-row (update-board (build-board 6 7) 5 1) 5)
;(display(string-to-int "z"))
(input-loop (string-to-int (read-line)))