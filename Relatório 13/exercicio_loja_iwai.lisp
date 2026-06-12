(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defun adicional-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca-magica)
  (cond
    ((> forca-magica 80) (* forca-magica 1.5))
    (t                    forca-magica)))

(defun descricao-venda (i)
  (format nil "~a | Preco c/ imposto: R$ ~,2f | Forca Magica c/ bonus: ~,1f"
          (item-nome        i)
          (item-preco       i)
          (item-forca-magica i)))

(defun processa-venda (catalogo)
  (let* ((armas
           (remove-if-not
             (lambda (i) (eq (item-tipo i) 'arma))
             catalogo))
         (com-imposto
           (mapcar
             (lambda (i)
               (make-item :nome        (item-nome        i)
                          :tipo        (item-tipo        i)
                          :preco       (adicional-imposto (item-preco i))
                          :forca-magica (item-forca-magica i)))
             armas))
         (com-bonus
           (mapcar
             (lambda (i)
               (make-item :nome        (item-nome        i)
                          :tipo        (item-tipo        i)
                          :preco       (item-preco       i)
                          :forca-magica (bonus-maldicao   (item-forca-magica i))))
             com-imposto)))
    (mapcar #'descricao-venda com-bonus)))

(defun main ()
  (let ((catalogo
          (list
            (make-item :nome "Pistola Corretor"   :tipo 'arma     :preco  800.0 :forca-magica  90.0)
            (make-item :nome "Espada Maldita"     :tipo 'arma     :preco 1200.0 :forca-magica  60.0)
            (make-item :nome "Pocao de Sigilo"    :tipo 'pocao    :preco  300.0 :forca-magica  40.0)
            (make-item :nome "Amuleto de Iwai"    :tipo 'artefato :preco  950.0 :forca-magica  85.0)
            (make-item :nome "Revolver Phantom"   :tipo 'arma     :preco 1500.0 :forca-magica 100.0))))

    (format t "=== Loja Clandestina de Iwai ===~%~%")
    (format t "=== Resultado de processaVenda (so Armas) ===~%")
    (dolist (s (processa-venda catalogo))
      (format t "~a~%" s))))

(main)
