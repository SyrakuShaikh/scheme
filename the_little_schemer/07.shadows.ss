(define matom?
  (lambda (a)
    (and (not (null? a)) (not (pair? a)))))
;; function 'numbered?':
;; test whether a S-expression only contains
;; numbers or "+", "*", "**".
(define numbered?
  (lambda (s)
    (cond
     ((matom? s) (or (or (number? s) (eq? s '+))
                    (or (eq? s '*) (eq? s '**))))
     ((numbered? (car s)) (or (null? (cdr s))
                              (numbered? (cdr s))))
     (else #f))))
;;
(matom? '1)
;; #t
(matom? 1)
;; #t
(matom? 'a)
;; #t
(numbered? '+)
;; #t
(numbered? '**)
;; #t
(numbered? '(3 + (4 ** 5)))
;; #t
(numbered? '(2 * sausage))
;; #f
(numbered? '((4 * 5)))
;; #t
(numbered? '1)
;; #t
;;;; correct!
;;;; In fact, my version test a list
;;;; instead of a S-expression.
;; from the book
(define bnumed?
  (lambda (aexp)
    (cond
     ((matom? aexp) (number? aexp))
     (else
      (and
       (bnumed? (car aexp))
       (bnumed? (car (cdr (cdr aexp)))))))))
;;
(bnumed? '(1 sausage 2))
;; #t, and obviously wrong.

;; function 'value': eval a arithmetic expression
;; to be specific, a numbered arithmetic expression that
;; contains only binary operators: + * expt.
(define value
  (lambda (nexp)
    (cond
     ((number? nexp) nexp)
     ((eq? '+ (car (cdr nexp)))
      (+ (value (car nexp)) (value (car (cdr (cdr nexp))))))
     ((eq? '* (car (cdr nexp)))
      (* (value (car nexp)) (value (car (cdr (cdr nexp))))))
     (else
      (expt (value (car nexp)) (value (car (cdr (cdr nexp)))))))))
;;
(value '13)
;;
(value '(1 + 3))
;;
(value '(1 + (3 ** 4)))
;;
;; all correct.
;; pay attention to the structure of "(car (cdr (cdr ...)))"

;; Now, let's assume that the S-expression "nexp"
;; takes the lisp-like form (+ a b)
(define nvalue
  (lambda (nexp)
    (cond
     ((number? nexp) nexp)
     ((eq? '+ (car nexp))
      (+ )))))
