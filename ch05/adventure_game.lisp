(defparameter *nodes* '((living-room (you are in the living-room.
                                          a wizard is snoring loudly on the couch.))
                        (garden (you are in a beautiful garden.
                                     there is a well in front of you.))
                        (attic (you are in the attic.
                                    there is a giant welding torch in the corner.))))
; (assoc 'garden *nodes*)
; returns (GARDEN (YOU ARE IN A BEAUTIFUL GARDEN. THERE IS A WELL IN FRONT OF YOU.))

; (cadr (assoc 'garden *nodes*))
; returns (YOU ARE IN A BEAUTIFUL GARDEN. THERE IS A WELL IN FRONT OF YOU.)


(defun describe-location (location nodes)
  (cadr (assoc location nodes)))
; (describe-location 'living-room *nodes*)
; returns (YOU ARE IN THE LIVING-ROOM. A WIZARD IS SNORING LOUDLY ON THE COUCH.)


(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))
; (assoc 'garden *edges*)
; returns (GARDEN (LIVING-ROOM EAST DOOR))

; (cadr (assoc 'garden *edges*))
; returns (LIVING-ROOM EAST DOOR)


(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))
; (describe-path '(garden west door))
; returns (THERE IS A DOOR GOING WEST FROM HERE.)

; (mapcar #'describe-path '((GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER)))
; returns
; ((THERE IS A DOOR GOING WEST FROM HERE.)
;  (THERE IS A LADDER GOING UPSTAIRS FROM HERE.))


(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
; (describe-paths 'living-room *edges*)
; returns (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE.)


(defparameter *objects* '(whiskey bucket frog chain))


(defparameter *object-locations* '((whiskey living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden)))


(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
                     (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))
; (objects-at 'living-room *objects* *object-locations*)
; returns (WHISKEY BUCKET)


(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
                         `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))
; (describe-objects 'living-room *objects* *object-locations*)
; returns (YOU SEE A WHISKEY ON THE FLOOR. YOU SEE A BUCKET ON THE FLOOR.)


; current location
(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))
; (look)
; returns # if *location* is 'living-room
; (YOU ARE IN THE LIVING-ROOM.
;  A WIZARD IS SNORING LOUDLY ON THE COUCH.
;  THERE IS A DOOR GOING WEST FROM HERE.
;  THERE IS A LADDER GOING UPSTAIRS FROM HERE.
;  YOU SEE A WHISKEY ON THE FLOOR.
;  YOU SEE A BUCKET ON THE FLOOR.)
