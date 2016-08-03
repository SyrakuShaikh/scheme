(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))
;; define a new function lat?
;; to check if a list is made up of pure atoms or null.
(define lat?
  (lambda (l)
    (cond
     ((null? l) #t)
     ((atom? (car l)) (lat? (cdr l)))
     (else #f))))
(lat? '(apple banana cherry))
;; #t
(lat? '(bacon (and eggs)))
;; #f

(or (null? '()) (atom? '(a b c)))
;; #t

;; define another new function 'member?'
;; this is my version
(define mmember?
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     ((eq? a (car lat)) (mmember? a (cdr lat)))
     (else #f))))
;; this is from the book
(define member?
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     (else (or (eq? (car lat) a)
               (member? a (cdr lat)))))))
;; the latter is better: same meaning, less 'cond' questions.
