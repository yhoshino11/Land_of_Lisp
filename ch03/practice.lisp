; returns squared number
; (defun square (n)
  ; (* n n))

; retuns T
; (eq 'fooo 'FOOO)

; returns 2.0
; (+ 1 1.0)

; returns 8
; (expt 2 3)

; returns 2/3
; (/ 4 6)

; returns 0.6666667
; (/ 4.0 6)

; prints Tutti Frutti
; (princ "Tutti Frutti")

; prints escaped string
; (princ "He yelled \"Stop that thief!\" from the busy street.")

; returns 128
; (expt 2 (+ 3 4))

; returns data
; '(expt 2 3)

; returns (CHICKEN . CAT)
; (cons 'chicken 'cat)

; returns (CHICKEN)
; (cons 'chicken 'nil)

; returns (CHICKEN)
; (cons 'chicken ())

; returns (PORK BEEF CHICKEN)
; (cons 'pork '(beef chicken))

; returns (BEEF CHICKEN)
; (cons 'beef (cons 'chicken ()))

; returns (PORK BEEF CHICKEN)
; (cons 'pork (cons 'beef (cons 'chicken ())))

; returns PORK
; (car '(pork beef chicken))

; returns (BEEF CHICKEN)
; (cdr '(pork beef chicken))

; returns BEEF
; (car (cdr '(pork beef chicken)))

; returns BEEF
; (cadr '(pork beef chicken))

; returns (PORK BEEF CHICKEN)
; (list 'pork 'beef 'chicken')

; returns (PEAS CARROTS TOMATOES)
; (car '((peas carrots tomatoes) (pork beef chicken)))

; returns (CARROTS TOMATOES)
; (cdr '(peas carrots tomatoes))

; returns (CARROTS TOMATOES)
; (cdr (car '((peas carrots tomatoes) (pork beef chicken))))

; returns (CARROTS TOMATOES)
; (cdar '((peas carrots tomatoes) (pork beef chicken)))

; returns ((PEAS CARROTS TOMATOES) (PORK BEEF CHICKEN))
; (cons (cons 'peas (cons 'carrots (cons 'tomatoes ())))
      ; (cons (cons 'pork (cons 'beef (cons 'chicken ()))) ()))

; returns (DUCK)
; (cddr '((peas carrots tomatoes) (pork beef chicken) duck))

; returns (TOMATOES)
; (caddr '((peas carrots tomatoes) (pork beef chicken) duck))

; returns BEEF
; (cadadr '((peas carrots tomatoes) (pork beef chicken) duck))
