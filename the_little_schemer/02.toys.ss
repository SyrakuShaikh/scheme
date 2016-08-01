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

(null? 'a)
;; #f
(null? '())
;; #t

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))
(atom? 'x)
(atom? '())

(eq? 'apple 'apple)

(eq? 1 1)
;; #t
(eq? 1.2 1.2)
;; #f

(eq? (cdr '(soured milk)) 'milk)
;; #f
