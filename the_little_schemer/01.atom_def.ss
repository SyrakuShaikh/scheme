(atom? (quote ()))
;; the result of the S-expression above is '#t'.
(define natom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(natom? (quote ()))
;; this is '#f' as expected by the book.
