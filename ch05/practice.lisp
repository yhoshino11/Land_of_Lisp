; (mapcar #'sqrt '(1 2 3 4 5))
; returns (1 1.4142135 1.7320508 2 2.236068)

; (mapcar #'car '((foo bar) (baz qux)))
; (mapcar (function car) '((foo bar) (baz qux)))
; (let ((car "Honda Civic"))
  ; (mapcar #'car '((foo bar) (baz qux))))
; returns (FOO BAZ)

; (append '(mary had) '(a) '(little lamb))
; returns (MARY HAD A LITTLE LAMB)

; (apply #'append '((THERE IS A DOOR GOING WEST FROM HERE.)
                  ; (THERE IS A LADDER GOING UPSTAIRS FROM HERE.)))
; returns (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE.)

; (find 'y '((5 x) (3 y) (7 z)) :key #'cadr)
; returns (3 Y)
