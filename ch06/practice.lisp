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
