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

(deftemplate question-answer
	(slot id)
    (slot question)
    (slot answer))

(defquery find-ask
    "retrive ask facts"
    (declare (variables ))
    (ask (id ?id) (text ?text)))

(defquery find-recommendation
    "retrive recommendation facts"
    (declare (variables ))
    (recommendation (text ?text)))

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

(defrule init-ask
    (question (id 1) (text ?text))
    =>
    (assert (ask (id 1) (text ?text))))

(defrule 1-ya-2
    (answer (id 1) (answer "ya"))
    (question (id 1) (text ?textq))
    (question (id 2) (text ?text))
    =>
    (assert (ask (id 2) (text ?text)))
    (assert (question-answer (id 1) (question ?textq) (answer "ya"))))

(defrule 1-tidak-3
    (answer (id 1) (answer "tidak"))
    (question (id 1) (text ?textq))
    (question (id 3) (text ?text))
    =>
    (assert (ask (id 3) (text ?text)))
    (assert (question-answer (id 1) (question ?textq) (answer "tidak"))))

(defrule 2-ya-5
    (answer (id 2) (answer "ya"))
    (question (id 2) (text ?textq))
    (question (id 5) (text ?text))
    =>
    (assert (ask (id 5) (text ?text)))
    (assert (question-answer (id 2) (question ?textq) (answer "ya"))))

(defrule 2-tidak-7
    (answer (id 2) (answer "tidak"))
    (question (id 2) (text ?textq))
    (question (id 7) (text ?text))
    =>
    (assert (ask (id 7) (text ?text)))
    (assert (question-answer (id 2) (question ?textq) (answer "tidak"))))

(defrule 3-ya-11
    (answer (id 3) (answer "ya"))
    (question (id 3) (text ?textq))
    (question (id 11) (text ?text))
    =>
    (assert (ask (id 11) (text ?text)))
    (assert (question-answer (id 3) (question ?textq) (answer "ya"))))

(defrule 3-tidak-13
    (answer (id 3) (answer "tidak"))
    (question (id 3) (text ?textq))
    (question (id 13) (text ?text))
    =>
    (assert (ask (id 13) (text ?text)))
    (assert (question-answer (id 3) (question ?textq) (answer "tidak"))))

(defrule 4-ya
    (answer (id 4) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Sapo Tahu"))))

(defrule 4-tidak
    (answer (id 4) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Gado-gado"))))

(defrule 5-ya-6
    (answer (id 5) (answer "ya"))
    (question (id 5) (text ?textq))
    (question (id 6) (text ?text))
    =>
    (assert (ask (id 6) (text ?text)))
    (assert (question-answer (id 5) (question ?textq) (answer "ya"))))

(defrule 5-tidak
    (answer (id 5) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Salad"))))

(defrule 6-ya
    (answer (id 6) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Puding Chia"))))

(defrule 6-tidak
    (answer (id 6) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Yogurt"))))

(defrule 7-ya-8
    (answer (id 7) (answer "ya"))
    (question (id 7) (text ?textq))
    (question (id 8) (text ?text))
    =>
    (assert (ask (id 8) (text ?text)))
    (assert (question-answer (id 7) (question ?textq) (answer "ya"))))

(defrule 7-tidak-9
    (answer (id 7) (answer "tidak"))
    (question (id 7) (text ?textq))
    (question (id 9) (text ?text))
    =>
    (assert (ask (id 9) (text ?text)))
    (assert (question-answer (id 7) (question ?textq) (answer "tidak"))))

(defrule 8-ya
    (answer (id 8) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Black Forest"))))

(defrule 8-tidak
    (answer (id 8) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Cokelat Batangan"))))

(defrule 9-ya
    (answer (id 9) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Ice Cream"))))

(defrule 9-tidak-10
    (answer (id 9) (answer "tidak"))
    (question (id 9) (text ?textq))
    (question (id 10) (text ?text))
    =>
    (assert (ask (id 10) (text ?text)))
    (assert (question-answer (id 9) (question ?textq) (answer "tidak"))))

(defrule 10-ya
    (answer (id 10) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Bubur Sumsum"))))

(defrule 10-tidak
    (answer (id 10) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Wedang Ronde"))))

(defrule 11-ya-12
    (answer (id 11) (answer "ya"))
    (question (id 11) (text ?textq))
    (question (id 12) (text ?text))
    =>
    (assert (ask (id 12) (text ?text)))
    (assert (question-answer (id 11) (question ?textq) (answer "ya"))))

(defrule 11-tidak-4
    (answer (id 11) (answer "tidak"))
    (question (id 11) (text ?textq))
    (question (id 4) (text ?text))
    =>
    (assert (ask (id 4) (text ?text)))
    (assert (question-answer (id 11) (question ?textq) (answer "tidak"))))

(defrule 12-ya
    (answer (id 12) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Telur Rebus"))))

(defrule 12-tidak
    (answer (id 12) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Omelet Sayur"))))

(defrule 13-ya-14
    (answer (id 13) (answer "ya"))
    (question (id 13) (text ?textq))
    (question (id 14) (text ?text))
    =>
    (assert (ask (id 14) (text ?text)))
    (assert (question-answer (id 13) (question ?textq) (answer "ya"))))

(defrule 13-tidak-15
    (answer (id 13) (answer "tidak"))
    (question (id 13) (text ?textq))
    (question (id 15) (text ?text))
    =>
    (assert (ask (id 15) (text ?text)))
    (assert (question-answer (id 13) (question ?textq) (answer "tidak"))))

(defrule 14-ya
    (answer (id 14) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Ikan Bakar Balado"))))

(defrule 14-tidak
    (answer (id 14) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Rendang"))))

(defrule 15-ya
    (answer (id 15) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Sop Buntut"))))

(defrule 15-tidak
    (answer (id 15) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Ayam Rebus"))))

(defrule ans-ques
    (answer (id ?id) (answer ?text))
    (question (id ?idq) (text ?textq))
	=>
    (if (eq ?id ?idq)
        then (assert (question-answer (id ?id) (question ?textq) (answer ?text)))))

(defrule remove-ask
 "rule to remove ask"
    ?i <- (remove-ask (id ?id))
    ?j <- (ask (id ?id))
 =>
    (retract ?i)
    (retract ?j))

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

(reset)
(bind ?text "")
(printout t "Masukkan rekomendasi makanan: ")
(bind ?text (readline))

(assert (recommendation (text (str-cat "Rekomendasi makanan untuk Anda adalah " ?text))))
(run)