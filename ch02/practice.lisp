; defparameter allows override
; (defparameter *foo* 5)
; (defparameter *foo* 6)
; *foo*

; defvar doesn't allow override
; (defvar *foo* 5)
; (defvar *foo* 6)
; *foo*

; Global Function
; (defun hello ()
  ; (format t "hello, world"))

; returns 22
; (ash 11 1)

; returns 5
; (ash 11 -1)

; returns 5
; (defun return-five ()
  ; (+ 2 3))

; Local Variable
; returns 11
; (let ((a 5)
      ; (b 6))
  ; (+ a b))

; Local Function
; returns 15
; (flet ((f (n)
          ; (+ n 10)))
  ; (f 5))

; returns 12
; (flet ((f (n)
          ; (+ n 10))
       ; (g (n)
          ; (- n 3)))
  ; (g (f 5)))

; labels allows you call itself
; returns 21
(labels ((a (n)
            (+ n 5))
         (b (n)
            (+ (a n) 6)))
  (b 10))





