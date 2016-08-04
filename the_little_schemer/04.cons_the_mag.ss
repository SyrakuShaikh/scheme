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
