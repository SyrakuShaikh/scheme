(car '())
;; nil

(car (l))
;; Error.

(cdr '())
;; nil

(car 'a)
;; Error.

(cons '(a) 'b)
;; ((a) . b)
(cons 0 1)
;; (0 . 1)

(null 'a)
;; nil
(null '())
;; t

(eq 'a 'a)
(eq 0 1)
;; nil
(eq 1 1)
;; t
(eq 1.2 1.2)
;; nil
(eq -1 -1)
;; t
