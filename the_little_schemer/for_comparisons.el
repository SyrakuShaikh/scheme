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
