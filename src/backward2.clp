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
    (recommendation (text "Lapis Legit"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "tidak")))
    )

(defrule food-2
    (recommendation (text "Roti Gandum"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "ya")))
    (assert (answer (id 5) (answer "ya")))
    )

(defrule food-3
    (recommendation (text "Salad"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "ya")))
    (assert (answer (id 5) (answer "tidak")))
    )

(defrule food-4
    (recommendation (text "Sapo Tahu"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "ya")))
    (assert (answer (id 4) (answer "ya")))
    )

(defrule food-5
    (recommendation (text "Gado-Gado"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "ya")))
    (assert (answer (id 4) (answer "tidak")))
    )

(defrule food-6
    (recommendation (text "Rendang"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "tidak")))
    )

(defrule print-answer
    (answer (id ?id) (answer ?text))
    =>
    (printout t ?id " " ?text crlf))

(reset)
(bind ?text "")
(printout t "Masukkan rekomendasi makanan:")
(bind ?text (readline))

(assert (recommendation (text ?text)))
(run)
