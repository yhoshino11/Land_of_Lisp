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


(defparameter *wizard-nodes* '((living-room (you are in the living-room.
                                                 a wizard is snoring loudly on the couch.))
                               (garden (you are in a beautiful garden.
                                            there is a well in front of you.))
                               (attic (you are in the attic.
                                           there is a giant welding torch in the corner.))))


(defparameter *wizard-edges* '((living-room (garden west door)
                                            (attic upstairs ladder))
                               (garden (living-room east door))
                               (attic (living-room downstairs ladder))))


(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))
; (dot-name 'living-room)
; returns "LIVING_ROOM"

; (dot-name 'foo!)
; returns "FOO_"

; (dot-name '24)
; returns "24"


; (substitute-if #\e #'digit-char-p "I'm a l33t hack3r!")
; returns "I'm a leet hacker!"


; (substitute-if 0 #'oddp '(1 2 3 4 5 6 7 8))
; returns (0 2 0 4 0 6 0 8)


(defparameter *max-label-length* 30)
(defun dot-label (exp)
  (if exp
    (let ((s (write-to-string exp :pretty nil)))
      (if (> (length s) *max-label-length*)
        (concatenate 'string (subseq s 0 (- *max-label-length* 3))
                     "...")
        s))
    ""))
; (dot-label 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx)
; returns "XXXXXXXXXXXXXXXXX..."


(defun nodes->dot (nodes)
  (mapc (lambda (node)
          (fresh-line)
          (princ (dot-name (car node)))
          (princ "[label=\"")
          (princ (dot-label node))
          (princ "\"];"))
        nodes))
; (nodes->dot *wizard-nodes*)
; returns
; LIVING_ROOM[label="(LIVING-ROOM (YOU ARE IN TH..."];
; GARDEN[label="(GARDEN (YOU ARE IN A BEAUT..."];
; ATTIC[label="(ATTIC (YOU ARE IN THE ATTI..."];


(defun edges->dot (edges)
  (mapc (lambda (node)
          (mapc (lambda (edge)
                  (fresh-line)
                  (princ (dot-name (car node)))
                  (princ "->")
                  (princ (dot-name (car edge)))
                  (princ "[label=\"")
                  (princ (dot-label (cdr edge)))
                  (princ "\"];"))
                (cdr node)))
        edges))
; (edges->dot *wizard-edges*)
; returns
; LIVING_ROOM->GARDEN[label="(WEST DOOR)"];
; LIVING_ROOM->ATTIC[label="(UPSTAIRS LADDER)"];
; GARDEN->LIVING_ROOM[label="(EAST DOOR)"];
; ATTIC->LIVING_ROOM[label="(DOWNSTAIRS LADDER)"];


(defun graph->dot (nodes edges)
  (princ "digraph{")
  (nodes->dot nodes)
  (edges->dot edges)
  (princ "}"))
; (graph->dot *wizard-nodes* *wizard-edges*)
; returns
; digraph{
; LIVING_ROOM[label="(LIVING-ROOM (YOU ARE IN TH..."];
; GARDEN[label="(GARDEN (YOU ARE IN A BEAUT..."];
; ATTIC[label="(ATTIC (YOU ARE IN THE ATTI..."];
; LIVING_ROOM->GARDEN[label="(WEST DOOR)"];
; LIVING_ROOM->ATTIC[label="(UPSTAIRS LADDER)"];
; GARDEN->LIVING_ROOM[label="(EAST DOOR)"];
; ATTIC->LIVING_ROOM[label="(DOWNSTAIRS LADDER)"];}
; "}"


(defun dot->png (fname thunk)
  (with-open-file (*standard-output*
                    fname
                    :direction :output
                    :if-exists :supersede)
    (funcall thunk))
  (ext:shell (concatenate 'string "dot -Tpng -O " fname)))


(defun graph->png (fname nodes edges)
  (dot->png fname
            (lambda ()
              (graph->dot nodes edges))))
; (graph->png "wizard.dot" *wizard-nodes* *wizard-edges*)
; creates wizard.dot.png


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
