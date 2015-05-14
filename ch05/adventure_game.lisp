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


(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))
; (describe-path '(garden west door))
; returns (THERE IS A DOOR GOING WEST FROM HERE.)


(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
; (describe-paths 'living-room *edges*)
; returns (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE.)
