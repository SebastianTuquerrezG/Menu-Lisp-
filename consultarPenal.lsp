; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

; Funcion para consultar el numero de Abogados que son de genero PENALISTA de un Consorcio especifico.
(defun consultarPenal(nit)
    (setq encontrado 0) ; Bandera para verificar si se encontro
    (setq i 0) ; Recorrer el vector de Consorcios preguntando si el nit coincide

    ; Si el primer Consorcio es null significa que NO se registraron los dos Consorcios
    (if (null (aref vectorConsorcios 0))
        (progn (print "No hay Consorcios registrados"))
        (progn 
            ; Comienza el primer bucle que recorre los Consorcios
            (loop
                ; Obtiene el Consorcio actual
                (setf auxConsorcio (aref vectorConsorcios i))
                ; Verifica si el nit del Consorcio actual coincide con el nit proporcionado
                (if (eq (Consorcio-nit auxConsorcio) nit)
                    (progn 
                        (setq encontrado 1)
                        ; Verifica si el Consorcio tiene Abogados registrados
                        (if (eq (aref (Consorcio-vectorAbogados auxConsorcio) 0) nil)
                            ; Si el Consorcio no tiene Abogados, imprime un mensaje
                            (format t "El Consorcio no tiene Abogados registrados...~%")
                            ; Si el Consorcio tiene Abogados, comienza el segundo bucle que recorre los Abogados
                            (progn
                                (setq numPenal 0)
                                (setq j 0)
                                (loop
                                    ; Obtiene el Abogado actual
                                    (setf auxAbogado (aref (Consorcio-vectorAbogados auxConsorcio) j))
                                    ; Verifica si el tipo del Abogado es penalista
                                    (if (string-equal (Abogado-tipo auxAbogado) "PENALISTA")
                                        ; Si el tipo es penalista, incrementa el contador de penalistas
                                        (setq numPenal (+ numPenal 1)))
                                    ; Incrementa el contador de Abogados
                                    (setq j (+ j 1))
                                    ; Si se han revisado todos los Abogados, sale del bucle de Abogados
                                    (when (>= j (length (Consorcio-vectorAbogados auxConsorcio))) (return))
                                )
                                ; Si no hay Abogados penalistas, imprime un mensaje
                                (if (= numPenal 0) 
                                    (format t "No hay Abogados PENALISTAS en el Consorcio: ~S, con NIT: ~d~%" (Consorcio-nombre auxConsorcio) nit)
                                    ; Si los hay, imprime el numero de Abogados penalistas
                                    (format t "Numero de Abogados PENALISTAS: ~d del Consorcio: ~S~%" numPenal (Consorcio-nombre auxConsorcio))
                                )
                            )
                        )
                    )
                )
                (setq i (+ i 1))
                (when (>= i (length vectorConsorcios)) (return))
            )
        )
    )
    (if (eq encontrado 0) (format t "El Consorcio con nit: ~d no se encuentra registrado~%" nit))
)
