; (cons 1 (cons 2 (cons 3 nil)))
; returns (1 2 3)

; (cons 1 (cons 2 3))
; returns (1 2 . 3)

; '(1 . (2 . (3 . nil)))
; returns (1 2 3)

; (cons 2 3)
; returns (2 . 3)

; (setf *print-circle* t)

; (defparameter foo '(1 2 3))
; (setf (cdddr foo) foo)
; returns #1=(1 2 3 . #1#)
; # This is infinite list loop
; '(1 2 3 1 2 3 ...)


; (defparameter *drink-order* '((bill . double-espresso)
                              ; (lisa . small-drip-coffee)
                              ; (john . medium-latte)))
; (assoc 'lisa *drink-order*)
; returns (LISA . SMALL-DRIP-COFFEE)

; (push '(lisa . large-mocha-with-whipped-cream) *drink-order*)
; (assoc 'lisa *drink-order*)
; returns (LISA . LARGE-MOCHA-WITH-WHIPPED-CREAM)


; (defparameter *house* '((walls (mortar (cement)
                                       ; (water)
                                       ; (sand))
                               ; (bricks))
                        ; (windows (glass)
                                 ; (frame)
                                 ; (curtains))
                        ; (roof (shingles)
                              ; (chimney))))
; (assoc 'walls *house*)
; returns (WALLS (MORTAR (CEMENT) (WATER) (SAND)) (BRICKS))


; (substitute-if #\e #'digit-char-p "I'm a l33t hack3r!")
; returns "I'm a leet hacker!"


; (substitute-if 0 #'oddp '(1 2 3 4 5 6 7 8))
; returns (0 2 0 4 0 6 0 8)


(with-open-file (my-stream
                  "testfile.txt"
                  :direction :output
                  :if-exists :supersede)
  (princ "Hello File!" my-stream))
; creates testfile.txt written "Hello File!" if the file doesn't exist.


(let ((cigar 5))
  cigar)
; returns 5


(let ((cigar 5)
      (dress 10))
  (+ cigar dress))
; returns 15


; (mapcar #'print '(a b c))
; returns
; A
; B
; C
; (A B C)


; (maplist #'print '(a b c))
; returns
; (A B C)
; (B C)
; (C)
; ((A B C) (B C) (C))
