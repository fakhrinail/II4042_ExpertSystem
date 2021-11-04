(defrule UpsCovid
	(batukdahak n)
	(batuk y)
	(pilek y)
	(demam y)
	(lemas y)
	(sesak y)
	=>
	(assert (product done))
	(printout t "Anda berkemungkinan tinggi covid" crlf)
)

(defrule KenaCovid
	(not (and
	(batukdahak n)
	(batuk y)
	(pilek y)
	(demam y)
	(lemas y)
	(sesak y)))
	=>
	(assert (product done))
	(printout t "Anda berkemungkinan rendah covid" crlf)
)

(defrule awal
	(declare (salience 500))
=>
(printout t "Apakah anda batuk? : (y/n)")
(bind ?response (read))
(assert (batuk ?response))
)

(defrule tipebatuk
	(declare (salience 300))
	(batuk y)
=>
(printout t "Apakah batuk anda berdahak? : (y/n)")
(bind ?response (read))
(assert (batukdahak ?response))
)

(defrule tanyapilek
	(declare (salience 200))
=>
(printout t "Apakah anda pilek? : (y/n)")
(bind ?response (read))
(assert (pilek ?response))
)

(defrule tanyademam
	(declare (salience 200))
=>
(printout t "Apakah anda pernah demam >37.5 derajat? : (y/n)")
(bind ?response (read))
(assert (demam ?response))
)

(defrule tanyalemas
	(declare (salience 200))
=>
(printout t "Apakah anda lemas? : (y/n)")
(bind ?response (read))
(assert (lemas ?response))
)

(defrule tanyasesak
	(declare (salience 200))
=>
(printout t "Apakah anda sesak? : (y/n)")
(bind ?response (read))
(assert (sesak ?response))
)



