; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

; Funcion para buscar un Consorcio por su nit
(defun buscarConsorcio(nit) 
    (setq encontrado 0) ; Bandera para verificar si se encontro
    (setq i 0) ; Recorrer el vector de Consorcios preguntando si el nit coincide

    ; Si el primer Consorcio es null significa que NO se registraron los dos Consorcios
    (if (null (aref vectorConsorcios 0))
        (progn
            (print "No hay Consorcios registrados"))
        (progn 
            (loop
                (setf auxConsorcio (aref vectorConsorcios i))

                (if (eq (Consorcio-nit auxConsorcio) nit)
                    ; Si coincide entonces la bandera se pone en true y se imprimen los datos del Consorcio y sus Abogados
                    (progn 
                        (setq encontrado 1)

                        (format t "Nit del Consorcio: ~d~%" (Consorcio-nit auxConsorcio))
                        (format t "Nombre del Consorcio: ~S~%" (Consorcio-nombre auxConsorcio))
                        (format t "Tipo del Consorcio: ~S~%" (Consorcio-tipo auxConsorcio))
                        ; Si el primer Abogado no tiene datos entonces no se han ingresado los Abogados de ese Consorcio
                        
                        (if (eq (aref (Consorcio-vectorAbogados auxConsorcio) 0) nil)
                            (format t "El Consorcio no tiene Abogados registrados...~%")
                            (progn
                                (setq j 0)
                                (loop
                                    (format t "~%")
                                    (format t "----Datos Abogado: ~d----~%" (+ j 1))
                                    (setf auxAbogado (aref (Consorcio-vectorAbogados auxConsorcio) j))
                                    (format t "Id del Abogado: ~d~%" (Abogado-numero_tarjeta auxAbogado))
                                    (format t "Nombre del Abogado: ~S~%" (Abogado-nombre auxAbogado))
                                    (format t "Apellido del Abogado: ~S~%" (Abogado-apellido auxAbogado))
                                    (format t "Tipo del Abogado: ~S~%" (Abogado-tipo auxAbogado))
                                    (format t "~%")
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
    (if (eq encontrado 0) (format t "El Consorcio con nit: ~d no se encuentra registrado~%" nit))
)
