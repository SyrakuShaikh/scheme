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
