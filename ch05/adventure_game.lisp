(defparameter *nodes* '((living-room (you are in the living-room.
                                          a wizard is snoring loudly on the couch.))
                        (garden (you are in a beautiful garden.
                                     there is a well in front of you.))
                        (attic (you are in the attic.
                                    there is a giant welding torch in the corner.))))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))


; ### USAGE ###
; returns (GARDEN (YOU ARE IN A BEAUTIFUL GARDEN. THERE IS A WELL IN FRONT OF YOU.))
; (assoc 'garden *nodes*)

; returns (YOU ARE IN A BEAUTIFUL GARDEN. THERE IS A WELL IN FRONT OF YOU.)
; (cadr (assoc 'garden *nodes*))

; returns (YOU ARE IN THE LIVING-ROOM. A WIZARD IS SNORING LOUDLY ON THE COUCH.)
; (describe-location 'living-room *nodes*)
