; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

; Función para registrar consorcios de abogados
(defun registrarConsorcios()
	(setq band 1) ; Bandera para las validaciones de los datos
	(setq i 0) ; Variable iteradora para el LOOP de buscar el consorcio de abogados

	(loop
		(format t "~%")
		(format t "---- Datos Consorcio de Abogados: ~d ----~%" (+ i 1))

		(setq consorcio (make-Consorcio)) ; Estructura de consorcio de abogados

		; Ingresar NIT del Consorcio de Abogados
		(loop
			(print "Digite el NIT del Consorcio de Abogados:")
			(setf (Consorcio-nit consorcio) (read))
			(if (typep (Consorcio-nit consorcio) 'integer)
				(setq band 1)  ; Si el tipo de dato es entero, el loop termina
				(progn (setq band 0) (format t "Error! Ingrese un tipo de dato valido para el NIT...~%")))
			(when (= band 1) (return)))

		; Ingresar Nombre del Consorcio de Abogados
		(loop
			(print "Digite el nombre del Consorcio de Abogados:")
			(setf (Consorcio-nombre consorcio) (read))
			(if (not (numberp (Consorcio-nombre consorcio)))
				(setq band 1)  ; Si el tipo de dato no es un numero, el loop termina
				(progn (setq band 0) (format t "Error! Ingrese un tipo de dato valido para el nombre...~%")))
			(when (= band 1) (return)))

		; Ingresar el tipo de consorcio de abogados
		(loop
			(print "Digite el tipo de consorcio de abogados (NACIONAL o INTERNACIONAL):")
			(setf (Consorcio-tipo consorcio) (read))
			(if (or (string= (Consorcio-tipo consorcio) "NACIONAL") (string= (Consorcio-tipo consorcio) "INTERNACIONAL"))
				(setq band 1)  ; Si el tipo de dato es valido, el loop termina
				(progn (setq band 0) (format t "Error! Ingrese un tipo de consorcio valido...~%")))
			(when (= band 1) (return)))

		; Inicializar el vector de abogados
		(setf vectorAbogadosConsorcio (make-array 3))
		(setf (Consorcio-vectorAbogados consorcio) vectorAbogadosConsorcio)

		; Registrar el consorcio de abogados en el vector
		(setf (aref vectorConsorcios i) consorcio)

		(setq i (+ i 1))
		(when (> i 1) (return))
	)
)
