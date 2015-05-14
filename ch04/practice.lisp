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

; returns T
; (and (oddp 5) (oddp 7) (oddp 9))

; returns T
; (or (oddp 4) (oddp 7) (oddp 8))

; returns T & changes *is-it-even* to be T
; (defparameter *is-it-even* nil)
; (or (oddp 4) (setf *is-it-even* t))

; returns T, but *is-it-even* stays nil. (setf *is-it-even* t) won't be executed.
; (defparameter *is-it-even* nil)
; (or (oddp 5) (setf *is-it-even* t))

; returns ONE-IS-IN-THE-LIST
; (if (member 1 '(3 4 1 5))
  ; 'one-is-in-the-list
  ; 'one-is-not-in-the-list)

; returns (1 5)
; (member 1 '(3 4 1 5))

; returns NIL-IS-IN-THE-LIST
; (if (member nil '(3 4 nil 5))
  ; 'nil-is-in-the-list
  ; 'nil-is-not-in-the-list)

; returns 5
; (find-if #'oddp '(2 4 5 6))

; returns THERE-IS-AN-ODD-NUMBER
; (if (find-if #'oddp '(2 4 5 6))
  ; 'there-is-an-odd-number
  ; 'there-is-no-odd-number)

; returns nil
; (find-if #'null '(2 4 nil 6))

; returns ITS-AN-APPLE
; (defparameter *fruit* 'apple)
; (cond ((eq *fruit* 'apple) 'its-an-apple)
      ; ((eq *fruit* 'orange) 'its-an-orange))

; returns T
; (equal 'apple 'apple)
; (equal (list 1 2 3) (list 1 2 3))
; (equal '(1 2 3) (cons 1 (cons 2 (cons 3 ()))))
; (equal 5 5)
; (equal 2.5 2.5)
; (equal "foo" "foo")
; (equal #\a #\a)
; (eql 'foo 'foo)
; (eql 3.4 3.4)
; (eql #\a #\a)
; (equalp "Bob Smith" "bob smith")
; (equalp 0 0.0)
