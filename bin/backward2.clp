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
    (question (id 1) (text "Anda ingin makanan manis? [ya/tidak]:"))
    (question (id 2) (text "Apakah anda sedang dalam program diet? [ya/tidak]:"))
    (question (id 3) (text "Apakah anda vegetarian? [ya/tidak]:"))
    (question (id 4) (text "Apakah anda alergi pada kacang? [ya/tidak]:"))
    (question (id 5) (text "Apakah anda alergi pada buah? [ya/tidak]:"))
    (question (id 6) (text "Apakah anda menghindari gluten? [ya/tidak]:"))
    (question (id 7) (text "Apakah anda suka cokelat? [ya/tidak]:"))
    (question (id 8) (text "Apakah anda suka kue? [ya/tidak]:"))
    (question (id 9) (text "Apakah anda suka makanan dingin? [ya/tidak]:"))
    (question (id 10) (text "Apakah anda suka makanan bersantan? [ya/tidak]:"))
    (question (id 11) (text "Apakah anda mengonsumsi telur? [ya/tidak]:"))
    (question (id 12) (text "Apakah anda menghindari garam? [ya/tidak]:"))
    (question (id 13) (text "Apakah anda suka makanan pedas? [ya/tidak]:"))
    (question (id 14) (text "Apakah anda suka seafood? [ya/tidak]:"))
    (question (id 15) (text "Apakah anda suka makanan berlemak? [ya/tidak]:"))
    )

(defrule food-1
    (recommendation (text "Puding Chia"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "ya")))
    (assert (answer (id 5) (answer "ya")))
    (assert (answer (id 6) (answer "ya")))
    )

(defrule food-2
    (recommendation (text "Yogurt"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "ya")))
    (assert (answer (id 5) (answer "ya")))
    (assert (answer (id 6) (answer "tidak")))
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
    (assert (answer (id 11) (answer "tidak")))
    )

(defrule food-5
    (recommendation (text "Gado-Gado"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "ya")))
    (assert (answer (id 4) (answer "tidak")))
    (assert (answer (id 11) (answer "tidak")))
    )

(defrule food-6
    (recommendation (text "Rendang"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "tidak")))
    (assert (answer (id 13) (answer "ya")))
    (assert (answer (id 14) (answer "tidak")))
    )

(defrule food-7
    (recommendation (text "Black Forest"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "tidak")))
    (assert (answer (id 7) (answer "ya")))
    (assert (answer (id 8) (answer "ya")))
    )

(defrule food-8
    (recommendation (text "Coklat Batangan"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "tidak")))
    (assert (answer (id 7) (answer "ya")))
    (assert (answer (id 8) (answer "tidak")))
    )

(defrule food-9
    (recommendation (text "Ice Cream"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "tidak")))
    (assert (answer (id 7) (answer "tidak")))
    (assert (answer (id 9) (answer "ya")))
    )

(defrule food-10
    (recommendation (text "Bubur Sumsum"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "tidak")))
    (assert (answer (id 7) (answer "tidak")))
    (assert (answer (id 9) (answer "tidak")))
    (assert (answer (id 10) (answer "ya")))
    )

(defrule food-11
    (recommendation (text "Wedang Ronde"))
    =>
    (assert (answer (id 1) (answer "ya")))
    (assert (answer (id 2) (answer "tidak")))
    (assert (answer (id 7) (answer "tidak")))
    (assert (answer (id 9) (answer "tidak")))
    (assert (answer (id 10) (answer "tidak")))
    )

(defrule food-12
    (recommendation (text "Telur Rebus"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "ya")))
    (assert (answer (id 11) (answer "ya")))
    (assert (answer (id 12) (answer "ya")))
    )

(defrule food-13
    (recommendation (text "Omelet Sayur"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "ya")))
    (assert (answer (id 11) (answer "ya")))
    (assert (answer (id 12) (answer "tidak")))
    )

(defrule food-14
    (recommendation (text "Ikan Bakar Balado"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "tidak")))
    (assert (answer (id 13) (answer "ya")))
    (assert (answer (id 14) (answer "ya")))
    )

(defrule food-15
    (recommendation (text "Sop Buntut"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "tidak")))
    (assert (answer (id 13) (answer "tidak")))
    (assert (answer (id 15) (answer "ya")))
    )

(defrule food-16
    (recommendation (text "Ayam Rebus"))
    =>
    (assert (answer (id 1) (answer "tidak")))
    (assert (answer (id 3) (answer "tidak")))
    (assert (answer (id 13) (answer "tidak")))
    (assert (answer (id 15) (answer "tidak")))
    )

(defrule print-answer
    (answer (id ?id) (answer ?answer))
    =>
    (printout t ?id " " ?answer crlf))

(reset)
(bind ?text "")
(printout t "Masukkan rekomendasi makanan:")
(bind ?text (readline))

(assert (recommendation (text ?text)))
(run)
