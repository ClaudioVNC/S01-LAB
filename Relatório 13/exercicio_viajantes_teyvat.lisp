(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

(defun bonus-elemental (loc)
  (let ((base (local-recompensa loc))
        (elem (local-elemento   loc)))
    (cond
      ((or (eq elem 'pyro) (eq elem 'electro)) (* base 1.20))
      ((eq elem 'cryo)                          (* base 1.10))
      (t                                         base))))

(defun vale-a-pena (loc)
  (and (> (bonus-elemental loc) 500)
       (<= (local-dificuldade loc) 3)))

(defun rota-de-farm (catalogo)
  (mapcar
    (lambda (loc)
      (format nil "~a - Recompensa: ~,1f mora"
              (local-nome loc)
              (bonus-elemental loc)))
    (remove-if-not #'vale-a-pena catalogo)))

(defun main ()
  (let ((catalogo
          (list
            (make-local :nome "Dominio da Chama Vermelha" :elemento 'pyro    :dificuldade 2 :recompensa 450.0)
            (make-local :nome "Dominio das Neves"         :elemento 'cryo    :dificuldade 3 :recompensa 480.0)
            (make-local :nome "Palacio da Agua"           :elemento 'hydro   :dificuldade 4 :recompensa 600.0)
            (make-local :nome "Santuario do Trovao"       :elemento 'electro :dificuldade 2 :recompensa 430.0)
            (make-local :nome "Templo dos Ventos"         :elemento 'anemo   :dificuldade 1 :recompensa 390.0))))

    (format t "=== Viajantes de Teyvat ===~%~%")
    (format t "--- Catalogo Completo com Bonus Elemental ---~%")
    (dolist (loc catalogo)
      (format t "~a | Elemento: ~a | Dificuldade: ~a | Recompensa c/ bonus: ~,1f mora~%"
              (local-nome        loc)
              (local-elemento    loc)
              (local-dificuldade loc)
              (bonus-elemental   loc)))

    (format t "~%--- Rota de Farm Recomendada ---~%")
    (dolist (s (rota-de-farm catalogo))
      (format t "~a~%" s))))

(main)
