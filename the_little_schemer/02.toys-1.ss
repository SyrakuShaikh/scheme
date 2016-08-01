(car '())
;; No Answer!
;; Exception in Chez Console.

(car '(l))

(car (l))
;; No Answer!
;; Exception in Chez Console.

(cdr '())
;; No Answer!
;; Exception in Chez Console.

(cons 'a '())
(cons '(a) 'b)
;; not as stated in the book where the result should be No Answer.
;; here ((a) . b)

(car (cons 0 1))
(cdr (cons 0 1))
