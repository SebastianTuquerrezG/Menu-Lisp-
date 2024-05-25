; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

; Funcion para buscar un Abogado por su id en un Consorcio por su nit
(defun BuscarConsorcioAbogado(nit num_tarjeta)
    (setq encontrado 0) ; Bandera para verificar si se encontro
    (setq i 0) ; Recorrer el vector de Consorcios preguntando si el nit coincide

    ; Si el primer Consorcio es null significa que NO se registraron los dos Consorcios
    (if (null (aref vectorConsorcios 0))
        (progn (print "No hay Consorcios registrados"))
        (progn 
            (loop
                (setf auxConsorcio (aref vectorConsorcios i))

                (if (eq (Consorcio-nit auxConsorcio) nit)
                    ; Si coincide entonces la bandera se pone en 1 y se busca el Abogado
                    (progn 
                        (setq encontrado 1)

                        ; Si el primer Abogado no tiene datos entonces no se han ingresado los Abogados de ese Consorcio
                        (if (eq (aref (Consorcio-vectorAbogados auxConsorcio) 0) nil)
                            (format t "El Consorcio no tiene Abogados registrados...~%")
                            (progn
                                (setq j 0)
                                (loop
                                    ; Si el Consorcio tiene Abogados entonces se busca el Abogado por su id
                                    (setf auxAbogado (aref (Consorcio-vectorAbogados auxConsorcio) j))
                                    (if (eq (Abogado-numero_tarjeta auxAbogado) num_tarjeta)
                                        (progn
                                            ; Si se encuentra el Abogado se imprimen sus datos
                                            (setq encontrado 2)
                                            (format t "~%")
                                            (format t "Id del Abogado: ~d~%" (Abogado-numero_tarjeta auxAbogado))
                                            (format t "Nombre del Abogado: ~S~%" (Abogado-nombre auxAbogado))
                                            (format t "Apellido del Abogado: ~S~%" (Abogado-apellido auxAbogado))
                                            (format t "Tipo del Abogado: ~S~%" (Abogado-tipo auxAbogado))
                                            (format t "~%")
                                        )
                                    ) 
                                    (setq j (+ j 1))
                                    (when (> j 2) (return))
                                )
                            )
                        )
                    )
                )

                (setq i (+ i 1))
                (when (> i 1) (return))
            )
        )
    )

    (case encontrado 
        (0 
            (format t "~%El Consorcio con nit: ~d no se encuentra registrado~%" nit)
        )
        (1 
            (format t "El Abogado con id: ~d no se encuentra registrado en el Consorcio con nit: ~d~%" num_tarjeta nit)
        )
    )
)
