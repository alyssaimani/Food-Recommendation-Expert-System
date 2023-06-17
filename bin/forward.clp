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

(deffacts questions
    (question (id 1) (text "Anda ingin makanan manis? [ya/tidak]:"))
    (question (id 2) (text "Apakah anda sedang dalam program diet? [ya/tidak]:"))
    (question (id 3) (text "Apakah anda vegetarian? [ya/tidak]:"))
    (question (id 4) (text "Apakah anda alergi pada kacang? [ya/tidak]:"))
    (question (id 5) (text "Apakah anda alergi pada buah? [ya/tidak]:"))
    )

(defrule init-ask
    (question (id 1) (text ?text))
    =>
    (assert (ask (id 1) (text ?text))))

(defrule ask-question
    (ask (id ?i) (text ?text))
    (not (answer (id ?i)))
    =>
    (bind ?answer "")
    (while (and (neq (str-compare ?answer "ya")0)
            (neq (str-compare ?answer "tidak")0)) do
        (printout t ?text)
    	(bind ?answer (readline)))
    (assert (answer (id ?i)(answer ?answer)))
    )

(defrule 1-ya-2
    (answer (id 1) (answer "ya"))
    (question (id 2) (text ?text))
    =>
    (assert (ask (id 2) (text ?text))))

(defrule 1-tidak-3
    (answer (id 1) (answer "tidak"))
    (question (id 3) (text ?text))
    =>
    (assert (ask (id 3) (text ?text))))

(defrule 2-ya-5
    (answer (id 2) (answer "ya"))
    (question (id 5) (text ?text))
    =>
    (assert (ask (id 5) (text ?text))))

(defrule 2-tidak
    (answer (id 2) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Lapis Legit"))))

(defrule 3-ya-4
    (answer (id 3) (answer "ya"))
    (question (id 4) (text ?text))
    =>
    (assert (ask (id 4) (text ?text))))

(defrule 3-tidak
    (answer (id 3) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Rendang"))))

(defrule 4-ya
    (answer (id 4) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Sapo Tahu"))))

(defrule 4-tidak
    (answer (id 4) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Gado-gado"))))

(defrule 5-ya
    (answer (id 5) (answer "ya"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Roti Gandum"))))

(defrule 5-tidak
    (answer (id 5) (answer "tidak"))
    =>
    (assert (recommendation  (text "Rekomendasi makanan untuk Anda adalah Salad"))))

(defrule print-recommendation
    (recommendation (text ?text))
    =>
    (printout t ?text crlf))

(defrule no-recommendation
    (not(recommendation))
    =>
    (printout t "Tidak ada rekomendasi makanan yang sesuai" crlf))


(reset)
(run)