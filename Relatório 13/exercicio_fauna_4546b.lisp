(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defun filtra-por-perigo (catalogo)
  (remove-if (lambda (c) (eq (criatura-periculosidade c) 'baixa)) catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar
    (lambda (c)
      (format nil "~a: Vive em ~a"
              (criatura-nome c)
              (criatura-ambiente c)))
    (remove-if-not
      (lambda (c) (string= (criatura-ambiente c) "Deep"))
      catalogo)))

(defun descricao-criatura (c)
  (format nil "Nome: ~a | Ambiente: ~a | Periculosidade: ~a"
          (criatura-nome        c)
          (criatura-ambiente     c)
          (criatura-periculosidade c)))

(defun main ()
  (let ((catalogo
          (list
            (make-criatura :nome "Peeper"           :ambiente "Safe Shallows" :periculosidade 'baixa :vida-media  5.0)
            (make-criatura :nome "Reaper Leviathan" :ambiente "Crash Zone"    :periculosidade 'alta  :vida-media 80.0)
            (make-criatura :nome "Ghost Leviathan"  :ambiente "Deep"          :periculosidade 'alta  :vida-media 100.0)
            (make-criatura :nome "Warper"           :ambiente "Deep"          :periculosidade 'media :vida-media 20.0))))

    (format t "=== Catalogo Completo ===~%")
    (dolist (c catalogo)
      (format t "~a~%" (descricao-criatura c)))

    (format t "~%=== Criaturas Perigosas (nao Baixa) ===~%")
    (dolist (c (filtra-por-perigo catalogo))
      (format t "~a~%" (descricao-criatura c)))

    (format t "~%=== Relatorio de Profundidade ===~%")
    (dolist (s (relatorio-profundidade catalogo))
      (format t "~a~%" s))))

(main)
