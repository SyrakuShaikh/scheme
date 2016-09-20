;; function 'rember*': rember-star.
;; it accepts two arguments, the first is an atom;
;; the second is a list. remove all the atom "a" from the list "l".
;;; redefine 'atom?' function.
(define atom?
  (lambda (a)
    (and (not (null? a)) (not (pair? a)))))
;;;
(define rember*
  (lambda (a l)
    (cond
     ((null? l) '())
     (else
      (cond
       ((atom? (car l)) (cond
                         ((eq? a (car l)) (rember* a (cdr l)))
                         (else (cons (car l) (rember* a (cdr l))))))
       (else (cons (rember* a (car l)) (rember* a (cdr l)))))))))
(rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup))
;;=> ((coffee) ((tea)) (and (hick)))
(rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))
;;=> (((tomato)) ((bean)) (and ((flying))))
;;; the results are correct. Simplify?
;;; OK, match the book's except for the extra 'else'.
;;; ask three questions now for a list of S-expressions.

;; function 'insertR*': insert "new" right to "old".
(define insertR*
  (lambda (new old l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? (car l) old) (cons old (cons new (cdr l))))
       (else (cons (car l) (insertR* new old (cdr l))))))
     (else (cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))
(insertR* 'roast 'chuck
          '((how much (wood))
            could
            ((a (wood) chuck))
            (((chuck)))
            (if (a) ((wood chuck)))
            could chuck wood))
;;=> ((how much (wood))
;;    could
;;    ((a (wood) chuck roast))
;;    (((chuck roast)))
;;    (if (a) ((wood chuck roast)))
;;    could chuck roast wood)
;;; correct!

;; function 'occur*': counts elements occurring in a list.
(define occur*
  (lambda (a l)
    (cond
     ((null? l) 0)
     ((atom? (car l))
      (cond
       ((eq? (car l) a) (add1 (occur* a (cdr l))))
       (else (occur* a (cdr l)))))
     (else (+ (occur* a (car l)) (occur* a (cdr l)))))))
(occur* 'banana
        '((banana)
          (split ((((banana ice)))
                  (cream (banana))
                  sherbet))
          (banana)
          (bread)
          (banana brandy)))
;; 5

;; function 'member*': test an element's existence.
(define member*
  (lambda (a l)
    (cond
     ((null? l) #f)
     ((atom? (car l))
      (or
       (eq? a (car l))
       (member* a (cdr l))))
     (else (or
            (member* a (car l))
            (member* a (cdr l)))))))
(member* 'chips '((potato) (chips ((with) fish) (chips))))
;; #t
;; pay attention to the usage of "or".

;; function 'leftmost':
;; find the leftmost atom in a non-empty list
;; of S-expressions that does not contain
;; the empty list.
(define leftmost
  (lambda (l)
    (cond
     ((null? l) #f)
     ((atom? (car l)) (car l))
     (else (leftmost (car l))))))
(leftmost '((potato) (chips ((with) fish) (chips))))
;; potato
(leftmost '(((() four)) 17 (seventeen)))
;; #f
(leftmost '())
;; #f

;; function 'eqlist?': as the name.
(define eqlist?
  (lambda (l1 l2)
    (cond
     ((and (null? l1) (null? l2)) #t)
     ((or (null? l1) (null? l2)) #f)
     ((and (atom? (car l1)) (atom? (car l2)))
      (and (eq? (car l1) (car l2))
           (eqlist? (cdr l1) (cdr l2))))
     ((or (atom? (car l1)) (atom? (car l2))) #f)
     (else (and
            (eqlist? (car l1) (car l2))
            (eqlist? (cdr l1) (cdr l2)))))))
(eqlist? '(strawberry ice cream) '(strawberry ice cream))
;; #t
(eqlist? '(strawberry ice cream) '(strawberry cream ice))
;; #f
(eqlist? '(banana ((split))) '((banana) (split)))
;; #f
(eqlist? '(beef ((sausage)) (and (soda))) '(beef ((salami)) (and (soda))))
;; #f
(eqlist? '(beef ((sausage)) (and (soda))) '(beef ((sausage)) (and (soda))))
;; #t
;; correct! But asked 12 questions!!!
