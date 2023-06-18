(set-strategy depth)

(deftemplate question
    (slot id)
    (slot text))

(deftemplate ask
    (slot id)
    (slot text))

(deftemplate answer
    (slot id)
    (slot answer))

(deftemplate recommendation
    (slot text))

(deftemplate remove-ask
	(slot id))

(defquery find-ask
	"retrive ask facts"
	(declare (variables ))
	(ask (id ?id) (text ?text)))

(defquery find-recommendation
	"retrive recommendation facts"
	(declare (variables ))
	(recommendation (text ?text)))

(do-backward-chaining answer)

(deffacts questions
    (question (id 1) (text "Anda ingin makanan manis? [ya/tidak]: "))
    (question (id 2) (text "Apakah anda sedang dalam program diet? [ya/tidak]: "))
    (question (id 3) (text "Apakah anda vegetarian? [ya/tidak]: "))
    (question (id 4) (text "Apakah anda alergi pada kacang? [ya/tidak]: "))
    (question (id 5) (text "Apakah anda alergi pada buah? [ya/tidak]: "))
    )

(defrule food-1
    (answer (id 1) (answer "ya"))
    (answer (id 2) (answer "tidak"))
    =>
    (assert (recommendation (text "Rekomendasi makanan untuk Anda adalah Lapis Legit")))
    )

(defrule food-2
    (answer (id 1) (answer "ya"))
    (answer (id 2) (answer "ya"))
    (answer (id 5) (answer "ya"))
    =>
    (assert (recommendation (text "Rekomendasi makanan untuk Anda adalah Roti Gandum")))
    )

(defrule food-3
    (answer (id 1) (answer "ya"))
    (answer (id 2) (answer "ya"))
    (answer (id 5) (answer "tidak"))
    =>
    (assert (recommendation (text "Rekomendasi makanan untuk Anda adalah Salad")))
    )

(defrule food-4
    (answer (id 1) (answer "tidak"))
    (answer (id 3) (answer "ya"))
    (answer (id 4) (answer "ya"))
    =>
    (assert (recommendation (text "Rekomendasi makanan untuk Anda adalah Sapo Tahu")))
    )

(defrule food-5
    (answer (id 1) (answer "tidak"))
    (answer (id 3) (answer "ya"))
    (answer (id 4) (answer "tidak"))
    =>
    (assert (recommendation (text "Rekomendasi makanan untuk Anda adalah Gado-Gado")))
    )

(defrule food-6
    (answer (id 1) (answer "tidak"))
    (answer (id 3) (answer "tidak"))
    =>
    (assert (recommendation (text "Rekomendasi makanan untuk Anda adalah Rendang")))
    )

(defrule need-to-ask
    (need-answer (id ?id))
    (question (id ?id) (text ?text))
    =>
    (assert (ask (id ?id) (text ?text))))

;(defrule ask-rule
;    ?i <- (ask (id ?id) (text ?text))
;    =>
;    (bind ?answer "")
;    (while (and (neq (str-compare ?answer "ya")0)
;            (neq (str-compare ?answer "tidak")0)) do 
;        (printout t ?text)
;        (bind ?answer (readline)))
;    (assert (answer (id ?id) (answer ?answer)))
;    (retract ?i))

;(defrule print-recommendation
;    (recommendation (text ?text))
;    =>
;    (printout t ?text crlf))

;(defrule no-recommendation
;    (not(recommendation))
;    =>
;    (printout t "Tidak ada rekomendasi makanan yang sesuai" crlf))

;(reset)
;(run)

(defrule remove-ask
	"rule to remove ask"
    ?i <- (remove-ask (id ?id))
    ?j <- (ask (id ?id))
	=>
    (retract ?i)
    (retract ?j))