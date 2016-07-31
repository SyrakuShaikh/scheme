(atom? (quote ()))

(define natom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(natom? (quote ()))
