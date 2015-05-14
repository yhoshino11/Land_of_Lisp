; (print "foo")
; "foo"

; (progn (print "this")
       ; (print "is")
       ; (print "a")
       ; (print "test"))
; "this"
; "is"
; "a"
; "test"

; (progn (prin1 "this")
       ; (prin1 "is")
       ; (prin1 "a")
       ; (prin1 "test"))
; "this""is""a""test"

; (defun say-hello ()
  ; (print "Please type your name:")
  ; (let ((name (read)))
    ; (print "Nice to meet you, ")
    ; (print name)))
; (say-hello)
; "Please type your name:" yhoshino11
;
; "Nice to meet you, "
; YHOSHINO11

; (defun add-five ()
  ; (print "please enter a number:")
  ; (let ((num (read)))
    ; (print "When I add five I get")
    ; (print (+ num 5))))
; (add-five)
; "please enter a number:" 3
;
; "When I add five I get"
; 8

; (print '3)
; 3

; (print '3.4)
; 3.4

; (print 'foo)
; FOO

; (print '"foo")
; "foo"

; (print '#\a)
; #\a

; (princ '3)
; 3

; (princ '3.4)
; 3.4

; (princ 'foo)
; FOO

; (princ '"foo")
; "foo"

; (princ '#\a)
; #\a

; (progn (princ "This sentence will be interrupted")
       ; (princ #\newline)
       ; (princ "by an annoying newline character."))
; This sentence will be interrupted
; by an annoying newline character.

; (defun say-hello ()
     ; (princ "Please type your name:")
     ; (let ((name (read-line)))
       ; (princ "Nice to meet you, ")
       ; (princ name)))
; (say-hello)
; Please type your name:yhoshino11
; Nice to meet you, yhoshino11

; (defparameter *foo* '(+ 1 2))
; (eval *foo*)
; 3

; (defun game-repl ()
  ; (loop (print (eval (read)))))
; (game-repl) # Ctrl-C to exit
; (+ 1 1)
; 1


; # Before use geme-x functions, load adventure_game.lisp first.
(load '../ch05/adventure_game.lisp)

(defun game-read ()
  (let ((cmd (read-from-string
               (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
                     (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))
; (game-read)
; walk east
; (WALK 'EAST)

(defparameter *allowed-commands* '(look walk pickup inventory))
(defun game-eval (sexp)
  (if (member (car sexp) *allowed-commands*)
    (eval sexp)
    '(i do not know that command.)))
; (game-eval '(pickup 'whiskey))
; returns (YOU ARE NOW CARRYING THE WHISKEY)

; (game-eval '(list))
; returns (I DO NOT KNOW THAT COMMAND.)

(defun tweak-text (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eq item #\space) (cons item (tweak-text rest caps lit)))
            ((member item '(#\! #\? #\.)) (cons item (tweak-text rest t lit)))
            ((eq item #\") (tweak-text rest caps (not lit)))
            (lit (cons item (tweak-text rest nil lit)))
            ((or caps lit) (cons (char-upcase item) (tweak-text rest nil lit)))
            (t (cons (char-downcase item) (tweak-text rest nil nil)))))))

(defun game-print (lst)
  (princ (coerce (tweak-text (coerce (string-trim "() "
                                                  (prin1-to-string lst))
                                     'list)
                             t
                 nil)
         'string))
  (fresh-line))
; (game-print '(not only "comma," it also mentions the "iPad."))
; Not only comma, it also mentions the iPad.

(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))

; To Play Game with REPL
; (game-repl) # type below commands interactively.
; look
; walk west
; pickup chain
; scratch head
; pickup chicken
; walk east
; walk upstairs
; inventory
; walk china
; walk downstairs
; pickup bucket
; look
; quit
