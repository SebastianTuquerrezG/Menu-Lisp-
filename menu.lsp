; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

(load "vectoresYStructs.lsp")
(load "registrarConsorcio.lsp")
(load "registrarAbogado.lsp")
(load "buscarConsorcio.lsp")
(load "consultarPenal.lsp")
(load "BuscarConsorcioAbogado.lsp")

(crearStructConsorcio) ; Crea la estructura para los consorcios de abogados y el vector de consorcios
(crearStructAbogado) ; Crea la estructura para los abogados

(loop
    (print " ===========================================")
    (print " |                M E N U                  |")
    (print " ===========================================")
    (format t " ~%") 
    (print "   1.   Registrar Consorcio de Abogados ")
    (print "   2.   Registrar Abogado ")
    (print "   3.   Buscar Consorcio de Abogados por NIT ")
    (print "   4.   Buscar Abogado para un Consorcio Especifico")
    (print "   5.   Consultar numero de Abogados PENAL para un Consorcio Especifico")
    (print "   6.   Salir.")

    (format t " ~%")
    (print "   Digite la opcion:")
    (setq Opcion (read))
    (setq band 1) ; Bandera para las validaciones de los datos: 1=true, 0=false	

    (case Opcion
        (1  (registrarConsorcios))
        (2  (progn
                (loop
                    (print "= Registre 3 abogados por Consorcio =")
                    (print "Ingrese el NIT del consorcio al cual desea registrar abogados: ")
                    (setq nit (read))
                    (if (and (integerp nit) (> nit 0)) 
                        (setq band 1) ; Si el tipo de dato es entero positivo, el loop termina
                        (progn (setq band 0) (format t "Error! Ingrese un NIT valido (entero positivo)...~%"))
                    )
                    (when (= band 1) (return))
                )
                (registrarAbogados nit)
            )
        )
        (3  (progn
                (loop
                    (print "Ingrese el nit del consorcio a buscar: ")
                    (setq nit (read))
                    (if (and (integerp nit) (> nit 0)) 
                        (setq band 1) ; Si el tipo de dato es entero positivo, el loop termina
                        (progn (setq band 0) (format t "Error! Ingrese un NIT valido (entero positivo)...~%"))
                    )
                    (when (= band 1) (return))
                )
                (buscarConsorcio nit)
            )
        )
        (4  (progn
                (loop
                    (print "Ingrese el NIT del consorcio a buscar: ")
                    (setq nit (read))
                    (if (and (integerp nit) (> nit 0)) 
                        (progn ; Si el tipo de dato del NIT es entero positivo, entonces se pide el ID del abogado
                            (print "Ingrese el ID del abogado a buscar: ")
                            (setq num_tarjeta (read))
                            (if (and (integerp num_tarjeta) (> num_tarjeta 0))
                                (setq band 1) ; Si el tipo de dato del ID es entero positivo, el loop termina
                                (progn (setq band 0) (format t "Error! Ingrese un ID valido (entero positivo)...~%"))
                            )
                        )
                        (progn (setq band 0) (format t "Error! Ingrese un NIT valido (entero positivo)...~%"))
                    )
                    (when (= band 1) (return))
                )
                (BuscarConsorcioAbogado nit num_tarjeta)
            )
        )
        (5  (progn
                (loop
                    (print "Ingrese el NIT del consorcio a buscar: ")
                    (setq nit (read))
                    (if (and (integerp nit) (> nit 0)) 
                        (setq band 1) ; Si el tipo de dato es entero positivo, el loop termina
                        (progn (setq band 0) (format t "Error! Ingrese un NIT valido (entero positivo)...~%"))
                    )
                    (when (= band 1) (return))
                )
                (consultarPenal nit)
            )
        )
    )
    (when (eq Opcion 6) (print "Fin del programa") (return))
)
