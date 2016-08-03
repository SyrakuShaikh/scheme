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
