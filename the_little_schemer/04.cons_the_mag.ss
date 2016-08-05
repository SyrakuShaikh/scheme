;; new function 'rember' for "remove a member"
;; my version
(define mrember
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     ((eq? a (car lat)) (cdr lat))
     (else (cons (car lat) (mrember a (cdr lat)))))))
(mrember 'mint '(lamb chops and mint jelly))
;; (lamb chops and jelly)
(mrember 'apple '(apple banana cherry))
;; (banana cherry)
;;; OK! seems correct.
(mrember 'mint '(lamb chops and mint flavored mint jelly))
;; (lamb chops and flavored mint jelly)
;;; although the result is the same with the book's
;;; not all the 'mint' members are removed.
;; revised version 1
(define mrember1
  (lambda (a lat)
    (cond
     ((null? lat) '())
     ((eq? a (car lat)) (mrember1 a (cdr lat)))
     (else (cons (car lat) (mrember1 a (cdr lat)))))))
(mrember1 'mint '(lamb chops and mint flavored mint jelly))
;; (lamb chops and flavored jelly . #f) with '((null? lat) #f)'
;; (lamb chops and flavored jelly)      with '((null? lat) '())'
;;; OK!!! the correct version. Any simplifications?
;;;; mrember(need to modified the '#f' in first 'cond' question) is called
;;;; first-occurrence as required by the book.
;;;; mrember1 is called all-occurrences which matches the 'remove a member'
;;;; in my opinion.

;; the book's version
(define rember
  (lambda (a lat)
    (cond
     ((null? lat) (quote ()))
     (else (cond
            ((eq? (car lat) a) (cdr lat))
            (else (cons (car lat)
                        (rember
                         a (cdr lat)))))))))
;; according to the book, this version is better because
;; it's function structure coincides with the argument's structure.
;;; to be specific,
;;; The First Commandment. ask two questions: null? or else
;;; the simplified version asks three.
;;; two links for reference:
;;; https://goo.gl/DL35Y7 and https://goo.gl/fkP6bJ

;; (firsts l) new function by me first
(define mfirsts
  (lambda (l)
    (cond
     ((null? l) '())
     (else (cons (car (car l))
                 (mfirsts (cdr l)))))))
(mfirsts '((apple peach pumpkin)
           (plum pear cherry)
           (grape raisin pea)
           (bean carrot eggplant)))
;; (apple plum grape bean)
(mfirsts '((a b) (c d) (e f)))
;; (a c e)
(mfirsts '())
;; ()
(mfirsts '((five plums)
           (four)
           (eleven green oranges)))
;; (five four eleven)
(mfirsts '(((five plums) four)
           (eleven green oranges)
           ((no) more)))
;; ((five plums) eleven (no))
;; OK, all tests pass!
;;; and the same with the book's

;; try (seconds l)
;;; sandwich with a 'cdr'

;; insertR (R for right) function by me
(define minsertR
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     (else (cond
            ((eq? old (car lat)) (cons (car lat)
                                       (cons new (cdr lat))))
            (else (cons (car lat)
                        (minsertR new old (cdr lat)))))))))
(minsertR 'topping 'fudge '(ice cream with fudge for dessert))
;; (ice cream with fudge topping for dessert)
;; OK.
;;; the book's version is a little simpler
;;; with changing (cons (car lat) (cons new (cdr lat)))
;;; to (cons old (cons new (cdr lat)))
;;; fine. I forget the 'eq?'.
;; it's easy to implement 'insertL' (L for left)

;;; the 'subst' functions are also easy, ignore them here.
;;; the 'multirember' function is already defined as 'mrember1' above.

;; now try 'multiinsertR'
(define mmultiitR
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     (else (cond
            ((eq? old (car lat))
             (cons old
                   (cons new
                         (mmultiitR new old (cdr lat)))))
            (else
             (cons (car lat) (mmultiitR new old (cdr lat)))))))))
(mmultiitR 'X 'a '(a b c d a e f a g))
;; (a X b c d a X e f a X g)
;;; Correct!
