
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
(define (update-board board x y player_n)
    (if (= y 0)
        (cons (update-list x player_n (list-ref board y)) (cdr board)) 
        (cons (car board) (update-board (cdr board) x (- y 1) player_n))
    )
)

;Player's turn
(define (player-turn board player_n)   
    (if (full-row (list-ref board 5) 5 (input-loop (read-line)) )
        (display "That slot is full, please choose another") (input-loop (read-line))
    )
    (place-piece board (read-line) 0 player_n)
    (check-draw board 0 0)
    (print-row board 5)
    (player-turn board (change-turn player_n))   
)

;Checks to see if the input is valid
(define (input-loop in)
   (if (= (string-to-int in) 16)
        exit()
   )
   (if (> (string-to-int in) 0)
       (display "Not a valid input") (input-loop (read-line))
   )
    (if (< (string-to-int in) 5)
       (display "Not a valid input") (input-loop (read-line))
   )
    in
)

;Converts the input into an idex for the list
(define (string-to-int s)
    (- (char->integer (string-ref s 0)) 97)
)

;Checks to see if a row is full
(define (full-row board col row)
  (if (string=? (list-ref (list-ref board col) row) "x")
    #f
    #t
  )
)

(define (place-piece board row col player_n)
    ;(display row)
    (if (string=? (list-ref (list-ref board col) row) "x")
        (update-board board row col player_n)
        (place-piece board row (+ col 1) player_n) 
    )
    ;(display row)
)

(define (int-to-char i)
  (integer->char (+ i 48))
)

(define (check-draw board row count)
    (if (= count 8)
        (display "It's a Draw!")
    )
    (if (full-row board 5 row)
        (check-draw board (+ row 1) (+ count 1))
    )
)

(define (change-turn turn)
    (if (string=? turn "1")
        "2"
        "1"
    )
)

(define (win-check board player_n col row)
    (if (= row 8)
        (win-check board player_n (+ col 1) 0)
    )
    (if (string=? (list-ref (list-ref board col) row) player_n)
        (horizontal-win board col row count player_n)
        (verticall-win board col row count player_n)
        (diagonal-win board col row count player_n)
        (win-check board player_n col (+ row 1))
    )
)

(define (horizontal-win board col row count player_n)
    (if (string=? (list-ref (list-ref board col) row) player_n)
        (horizontal-win board col (+ row 1) (+ count 1) player_n)
    )
    (if (= count 4)
        (display "Congratulations, Player ${player_n}. You win")
    )
)

(define (verticall-win board col row count player_n)
    (if (string=? (list-ref (list-ref board col) row) player_n)
        (horizontal-win board (+ col 1) row (+ count 1) player_n)
    )
    (if (= count 4)
        (display "Congratulations, Player ${player_n}. You win")
    )
)

(define (diagonal-win board col row count player_n)
    (if (string=? (list-ref (list-ref board col) row) player_n)
        (horizontal-win board (+ col 1) (+ row 1) (+ count 1) player_n)
    )
    (if (= count 4)
        (display "Congratulations, Player ${player_n}. You win")
    )
)

;Function Tests
;(display "hello world")
;(update-list 5 "O" (list-ref (build-board 6 7) 0))
;(display (print-row (build-board 6 7) 5))
;(print-row (update-board (build-board 6 7) 4 5) 5)
;(display (full-row 4 (list-ref (update-board (build-board 6 7) 4 5) 5)))

;(display(string-to-int "z"))
;(input-loop (string-to-int (read-line)))

;(print-row (place-piece (build-board 6 7) 3 0 1) 5)
;(place-piece (place-piece (build-board 6 7) 3 0 "1") 3 0 "2")
;(full-row 3 (list-ref (place-piece (build-board 6 7) 3 0 1) 0))
;(print-row (update-board (build-board 6 7) 3 0 1) 5)
;(display (empty-row 1 (list-ref (update-board (build-board 6 7) 3 0 "1") 0)))
;(display (list-ref (update-board (build-board 6 7) 3 0 1) 0))
;(display(list-ref (list-ref (update-board (build-board 6 7) 3 0 1) 0) 1))
;(display #\x)
;(display (string=? (list-ref (list-ref (place-piece (build-board 6 7) 3 0 "1") 0) 3) "x"))
;(display (string=? "x" "1"))

;(print-row (place-piece (place-piece (build-board 6 7) 3 0 "1") 3 0 "2") 5)
;(print-row (update-board (update-board (update-board (build-board 6 3) 0 5 1) 1 5 1)2 5 1) 5)
;(display (check-draw (update-board (update-board (update-board (build-board 6 7) 0 5 "1") 1 5 "1")2 5 "1") 0 0))

;(display (change-turn "2"))
(display(string-to-int "b"))
;(display(input-loop "a"))
;(player-turn (build-board 6 7) "1") 