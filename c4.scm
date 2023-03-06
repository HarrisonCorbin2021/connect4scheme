
;Initialize the board

(define (build-list size item)
  (if (= 1 size)
     lst                      
     (cons item (build-list (- size 1) lst))
  )
)

(define (build-board num_rows num_columns)
    (if (= num_rows 0)
        (print-board board)
        (build-list (num_columns "x"))
    )
    (build-board (- num_rows 1) num_columns)
)


;Print the board
(define (print-board board currRow num_rows num_columns)
        (map (lambda (currRow) (display (print-row board currRow))) board)
        (newline)
        (print-board board (+ currRow 1) num_rows num_columns)
)

(define (print-row board row)
    (display (car row))
    (print-row board (cdr row))
)

;Main game loop
(define (gameLoop board)
    (build-board 6 7)
    (if (!= end_game 0)
        (player-turn board ) (gameLoop board)
    )
)


;Player's turn

(define (player-turn board player_n)
;Ask for a valid Input
(define row (read-line))
;If the top of the row is  empty, change the piece
    (if (!= (contains row) " ")
        (update-board board (update-list row player_n lst) row 0)
    )
;End player turn
    (changeTurn player_n)
)

(define (changeTurn currPlayer)
    (if(= currPlayer 1)
        2
        1
    )
)

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

(define (contains value lst)
    (fold 
        (lambda (item partial) 
            (or (eq? value item) partial)
        )
        #f
        lst
    )
)

(define (update-board board nCol nCol_num j)
    (if (?null board)
        board
        (if (= j nCol_num)
            (cons nCol (cdr board))
            (cons (car board) (update-board (cde board) nCol nCol_num (+ j 1)))
        )
    )
)

(define (update-list index value lst)
    (if(= index 0)
        (cons item (cdr lst))
        (cons (car lst) (replace-at (cdr lst) (- index 1) item))
    )
)

;Win check
(define (win-check board player_n)
    ;Check around a piece for another piece from the same player
    ;Make the piece you're looking at that other piece
    ;Check again for more pieces in that direction
    ;If the loop is done 3 times then end_game == 1
)

(display "hello world")
(display build-board 6 7)
