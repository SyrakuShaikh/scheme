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
    (cond
     ((zero? m) n)
     (else (ad1 (plus n (su1 m)))))))
(plus 10 0)
;; 10
(plus 10 2)
;; 12
(plus 48 24)
;; 72
;;; OK!
(define minus
  (lambda (n m)
    (cond
     ((zero? m) n)
     (else (su1 (minus n (su1 m)))))))
(minus 14 3)
;; 11
;;; a tuple is a list of numbers and be short as tup.
;; new function 'addtup'.
(define addtup
  (lambda (tup)
    (cond
     ((null? tup) 0)
     (else (plus (car tup) (addtup (cdr tup)))))))
(addtup '(1 2 3 4 5 6 7 8 9))
;; 45
(addtup '())
;; 0
;;; OK!

;; function 'times' i.e. multiply
(define times
  (lambda (n m)
    (cond
     ((or (zero? m) (zero? n)) 0)
     (else (plus n (times n (su1 m)))))))
(times 2 0)
;; 0
(times 0 3)
;; 0
(times 3 5)
;; 15
(times 13 4)
;; 52
;;; OK.
;;; the book's version only test m. structure problem?
;;; improvement
(define times1
  (lambda (n m)
    (cond
     ((zero? m) 0)
     (else (plus (times1 n (su1 m)) n)))))
;; function 'plus' already tested the second argument.

;; new function 'tup+';
(define tup+
  (lambda (tup1 tup2)
    (cond
     ((and (null? tup1) (null? tup2)) '())
     (else (cond
            ((or (null? tup1) (null? tup2)) '(#f))
            (else (cons (plus (car tup1) (car tup2))
                        (tup+ (cdr tup1) (cdr tup2)))))))))
(tup+ '(1 2 3 4 5) '(5 4 3 2 1))
;; (6 6 6 6 6) ;;; the result for 'null?' cond must be '() except for error.
(tup+ '(2 3 4 2 4) '(3 4 2 3))
;; (5 7 6 5 #f)
; (tup+ '(1 2) '(3 a))
;; NO ANSWER!
; (tup+ '(1 a) '(3 2))
;; NO ANSWER!
;;; the book's version assumes that tup1 and tup2 have the same lengths.
;;; therefore no the '(#f) line.
;; for different length lists
(define tu1+
  (lambda (tup1 tup2)
    (cond
     ((null? tup1) tup2)
     ((null? tup2) tup1)
     (else (cons (plus (car tup1) (car tup2))
                 (tu1+ (cdr tup1) (cdr tup2)))))))
(tu1+ '(1 2 3 4) '(5 6))
;; (6 8 3 4)
;;; OK. the first two questions in cond are nice!

;; now '>' function
(define big
  (lambda (n m)
    (cond
     ((eq? n m) #f)
     (else (cond
            ((zero? n) #f) ;; #f should be first.
            ((zero? m) #t)
            (else (big (su1 n) (su1 m))))))))
(big 2 1)
;; #t
(big 2 0)
;; #t
(big 1 2)
;; #f
(big 1 1)
;; #f
;;; of course, we should not use the 'eq?' operator here.
;;; but a equal-test is necessary.
;; omit the '<' function. pay attention to the #f-#t order.

;; now the equal-test function.
;;; of course we can user the '>' and '<' functions above.
;;; another way?
(define equ
  (lambda (n m)
    (cond
     ((zero? m) (zero? n))
     ((zero? n) #f)
     (else (equ (su1 n) (su1 m))))))
;; the first two questions of cond are elegant!
;;; use 'equ' to complete '>' and '<' is better.
;;; however take the '=', '<', and '>' functions together into considerations
;;; first equ (just the above) and then use it to define '<' and '>'
;;; is the same with the book's procedure.
