; returns I-AM-FALSE
; (if '()
  ; 'i-am-true
  ; 'i-am-false)

; returns I-AM-TRUE
; (if '(1)
  ; 'i-am-true
  ; 'i-am-false)

; returns list's length
; (defun my-length (list)
  ; (if list
    ; (1+ (my-length (cdr list)))
    ; 0))

; returns 4
; (my-length '(list with four symbols))

; returns T
; (eq '() nil)
; (eq '() ())
; (eq '() 'nil)

; returns YUP
; (if (= (+ 1 2) 3)
  ; 'yup
  ; 'nope)

; returns NOPE
; (if (= (+ 1 2) 4)
  ; 'yup
  ; 'nope)

; returns THE-LIST-HAS-STUFF-IN-IT
; (if '(1)
  ; 'the-list-has-stuff-in-it
  ; 'the-list-is-empty)

; returns THE-LIST-IS-EMPTY
; (if '()
  ; 'the-list-has-stuff-in-it
  ; 'the-list-is-empty)

; returns ODD-NUMBER
; (if (oddp 5)
  ; 'odd-number
  ; 'even-number)

; returns ODD-NUMBER # (/ 1 0) won't be executed.
; (if (oddp 5)
  ; 'ODD-NUMBER
  ; (/ 1 0))

; returns ODD-NUMBER & changes *number-was-odd* to be T
; (defvar *number-was-odd* nil)
; (if (oddp 5)
  ; (progn (setf *number-was-odd* t)
         ; 'odd-number)
  ; 'even-number)

; returns ODD-NUMBER & changes *number-is-odd* to be T
; (defvar *number-is-odd* nil)
; (when (oddp 5)
  ; (setf *number-is-odd* t)
  ; 'odd-number)

; returns EVEN-NUMBER & changes *number-is-odd* to be nil
; (defvar *number-is-odd* t)
; (unless (oddp 4)
  ; (setf *number-is-odd* nil)
  ; 'even-number)

; try
; > (pudding-eater 'johnny)
; > *arch-enemy*
; (defvar *arch-enemy* nil)
; (defun pudding-eater (person)
  ; (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                            ; '(curse you lisp alien - you ate my pudding))
        ; ((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
                             ; '(i hope you choked on my pudding johnny))
        ; (t '(why you eat my pudding stranger ?))))

; pudding-eater with case statement
; (defvar *arch-enemy* nil)
; (defun pudding-eater (person)
  ; (case person
    ; ((henry) (setf *arch-enemy* 'stupid-lisp-alien)
                        ; '(curse you lisp alien - you ate my pudding))
    ; ((johnny) (setf *arch-enemy* 'useless-old-johnny)
              ; '(i hope you choked on my pudding johnny))
    ; (otherwise '(why you eat my pudding stranger ?))))
























