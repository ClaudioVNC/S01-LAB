(defstruct erva
  nome
  preco-base)

(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 12) (< peso 30)) "10ml")
    ((or (< idade 18) (< peso 60)) "25ml")
    (t                             "50ml")))

(defun ajusta-preco (erva)
  (let ((nome (erva-nome      erva))
        (base (erva-preco-base erva)))
    (cond
      ((string= nome "Ginseng") (* base 3.0))
      ((string= nome "Lotus")   (* base 1.5))
      (t                         base))))

(defun descricao-erva (erva peso idade)
  (format nil "Erva: ~a | Preco ajustado: R$ ~,2f | Dosagem: ~a"
          (erva-nome erva)
          (ajusta-preco erva)
          (calcula-dosagem peso idade)))

(defun main ()
  (let ((ginseng  (make-erva :nome "Ginseng"  :preco-base 50.0))
        (lotus    (make-erva :nome "Lotus"    :preco-base 30.0))
        (camomila (make-erva :nome "Camomila" :preco-base 20.0)))

    (format t "=== Farmacia da Maomao ===~%~%")

    (format t "Paciente 1 - 8 anos, 25 kg~%")
    (format t "~a~%" (descricao-erva ginseng  25.0 8))
    (format t "~a~%" (descricao-erva lotus    25.0 8))
    (format t "~a~%~%" (descricao-erva camomila 25.0 8))

    (format t "Paciente 2 - 15 anos, 50 kg~%")
    (format t "~a~%" (descricao-erva ginseng  50.0 15))
    (format t "~a~%" (descricao-erva lotus    50.0 15))
    (format t "~a~%~%" (descricao-erva camomila 50.0 15))

    (format t "Paciente 3 - 35 anos, 80 kg~%")
    (format t "~a~%" (descricao-erva ginseng  80.0 35))
    (format t "~a~%" (descricao-erva lotus    80.0 35))
    (format t "~a~%~%" (descricao-erva camomila 80.0 35))))

(main)
