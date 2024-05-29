; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

(defun registrarAbogados(nit)
    (setq band 1) ; Bandera para las validaciones de los datos
    (setq encontrado 0) ; Bandera para verificar si se encontro el consorcio de abogados
    (setq i 0) ; Variable iteradora para el LOOP de buscar el consorcio de abogados

    ; Si el primer consorcio de abogados es null significa que NO se registraron los consorcios
    (if (null (aref vectorConsorcios 0))
        (print "No hay consorcios de abogados registrados")
        (progn 
            ; Se busca el consorcio de abogados en el vector de consorcios
            (loop
                (setf auxConsorcio (aref vectorConsorcios i))

                (if (eq (Consorcio-nit auxConsorcio) nit)
                    ; Si se encuentra, se piden los datos de los abogados de ese consorcio
                    (progn
                        (setq encontrado 1)
                        (format t "==== Abogados del Consorcio de Abogados ~S ====~%" (Consorcio-nombre auxConsorcio))
                        (setq j 0) ; Variable iteradora para el LOOP de agregar abogados al vector de abogados del consorcio
                        (loop
                            (format t "----Datos Abogado: ~d----~%" (+ j 1))

                            (setq abogado (make-Abogado)) ; Estructura de abogado

                            ; Ingresar Numero de Tarjeta Profesional del Abogado
                            (loop
                                (print "Digite el numero de tarjeta profesional del abogado:")
                                (setf (Abogado-numero_tarjeta abogado) (read))
                                (if (and (integerp (Abogado-numero_tarjeta abogado)) 
                                (<= (Abogado-numero_tarjeta abogado) 255))
                                    (setq band 1)  ; Si el tipo de dato es entero y <= 255, el loop termina
                                    (progn (setq band 0) (format t "Error! Ingrese un numero entero valido (<= 255) para el número de tarjeta profesional...~%")))
                                (when (= band 1) (return)))

                            ; Ingresar Nombre del Abogado
                            (loop
                                (print "Digite el nombre del abogado:")
                                (setf (Abogado-nombre abogado) (read-line))
                                (if (and (stringp (Abogado-nombre abogado))
                                        (not (some #'digit-char-p (Abogado-nombre abogado))))
                                    (setq band 1) ; Si el tipo de dato es una cadena y no contiene números, el loop termina
                                    (progn (setq band 0) (format t "Error! Ingrese un nombre valido (solo letras)...~%")))
                                (when (= band 1) (return)))

                            ; Ingresar Apellido del Abogado
                            (loop
                                (print "Digite el apellido del abogado:")
                                (setf (Abogado-apellido abogado) (read-line))
                                (if (and (stringp (Abogado-apellido abogado))
                                        (not (some #'digit-char-p (Abogado-apellido abogado))))
                                    (setq band 1) ; Si el tipo de dato es una cadena y no contiene números, el loop termina
                                    (progn (setq band 0) (format t "Error! Ingrese un apellido valido (solo letras)...~%")))
                                (when (= band 1) (return)))

                            ; Ingresar el Tipo de Abogado
                            (loop
                                (print "Digite el tipo de abogado (PENALISTA, CIVIL, LABORAL):")
                                (setf (Abogado-tipo abogado) (read))
                                (if (or (string= (Abogado-tipo abogado) "PENALISTA")
                                        (string= (Abogado-tipo abogado) "CIVIL")
                                        (string= (Abogado-tipo abogado) "LABORAL"))
                                    (setq band 1) ; Si el tipo de abogado es válido, el loop termina
                                    (progn (setq band 0) (format t "Error! Ingrese un tipo de abogado valido...~%")))
                                (when (= band 1) (return)))

                            ; Registrar el abogado en el vector de abogados del consorcio
                            (setf (aref (Consorcio-vectorAbogados auxConsorcio) j) abogado)
                            (setq j (+ j 1))
                            (when (> j 2) (return)))

                        )

                    )

                ; Incrementa el indice para buscar el siguiente consorcio de abogados
                (setq i (+ i 1))
                (when (> i 1) (return)))

            ; Si el consorcio de abogados no se encuentra, muestra un mensaje de error
            (if (= encontrado 0)
                (format t "El consorcio de abogados con NIT: ~d no se encuentra registrado~%" nit)
            )
        )
    )
)
