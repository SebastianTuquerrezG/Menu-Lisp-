; Integrantes:
; - Pablo Jose Restrepo Ruiz
; - Joan Sebastian Tuquerrez Gomez

; Declaracion de la estructura de Consorcio
(defun crearStructConsorcio()
    (defstruct Consorcio
        nit            ; Numero de identificacion tributaria del Consorcio
        nombre         ; Nombre del Consorcio
        tipo           ; Tipo de consorcio
        vectorAbogados ; Vector de abogados asociados al consorcio
    )
    ; Vector de Consorcios con capacidad para 2 Consorcios
    (setf vectorConsorcios (make-array 2))
)

; Declaracion de la estructura de Abogado
(defun crearStructAbogado()
    (defstruct Abogado
        numero_tarjeta ; Numero de tarjeta profesional del abogado
        nombre         ; Nombre del abogado
        apellido       ; Apellido del abogado
        tipo           ; Tipo de abogado (PENALISTA, CIVIL, LABORAL, etc.)
    )
)
