;; define 'atom?' first.
(define atom?
  (lambda (l)
    (and (not (pair? l)) (not (null? l)))))
(atom? 14)
;; #t
(atom? -3)
;; #t
(atom? 3.1416)
;; #t

;; new functions 'add1'
;;; in fact, already defined by Chez Scheme.
(define ad1
  (lambda (n)
    (+ n 1)))
(define su1
  (lambda (n)
    (- n 1)))

;; now write '+' function using 'zero?', 'ad1', and 'su1'.
(define plus
  (lambda (n m)
    ))
