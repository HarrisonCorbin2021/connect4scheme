(for-each (lambda (row)
	    (for-each (lambda (col)
			(display (format "Row ~a Col ~a\n" row col))
			)
		        '(0 1 2 3 4 5 6)
			); end col	      	
	    )
	    '(0 1 2 3 4 5) ; end row				
)

(begin 
                    ;(display (format "Looking at row ~a col ~a for ~a\n" row col board))
                    (if (string=? (list-ref (list-ref board col) row) player_n)
                        (begin 
                        (horizontal-win board col row 0 player_n) 
                        (vertical-win board col row 0 player_n) 
                        (diagonal-win board col row 0 player_n)
                        )
                    )
                )