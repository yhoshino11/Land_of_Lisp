(loop repeat 10
      collect 1)
; returns
; (1 1 1 1 1 1 1 1 1 1)


(loop for n from 1 to 10
      collect n)
; returns
; (1 2 3 4 5 6 7 8 9 10)


(loop for n from 1 to 10
      collect (+ 100 n))
; returns
; (101 102 103 104 105 106 107 108 109 110)
