;Survey ini dilakukan untuk memantau persebaran virus Corona bagi penumpang Internasional bandara X. 

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Survey Deteksi Penyebaran COVID-19 di Bandar Udara Internasional X")
  (printout t crlf "Hotline Corona Virus di Indonesia : 021-5210411 atau 081212123119" crlf)
  (printout t crlf crlf))
;--------------------------
(defrule demam>38
=>
(printout t "Apakah anda memiliki deman lebih dari 38 derajat Celcius [yes/no]? ")
(assert (gejala-demam (read))))

(defrule riwayat-perjalanan
(gejala-demam no)
=>
(printout t "Apakah anda memiliki riwayat perjalanan di negara dominan terjangkit (China dan Korea Selatan)[yes/no]? ")
(assert (negara-terjangkit (read))))

(defrule diduga-sehat
(and (gejala-demam no)
(negara-terjangkit no))
=>
(printout t "Kondisi anda Sehat. Selamat Melanjutkan Perjalanan" crlf)
(assert (kondisi-sehat yes)))

(defrule diduga-siaga
(and (gejala-demam no)
(negara-terjangkit yes))
=>
(printout t "Kondisi anda berstatus Siaga. Selamat melanjutkan perjalanan dan jaga kesehatan " crlf)
(assert (kondisi-siaga yes)))

(defrule batuk-pilek
(gejala-demam yes)
=>
(printout t "Apakah anda memiliki batuk, pilek atau keduanya [yes/no]?  ")
(assert (ada-batuk-pilek (read))))

(defrule diduga-flu
(and (gejala-demam yes)
(ada-batuk-pilek no))
=>
(printout t "Anda memiliki Demam. Selamat melanjutkan perjalanan dan jangan lupa berobat " crlf)
(assert (kondisi-demam yes)))

(defrule gejala-pernapasan
(and (gejala-demam yes)
(ada-batuk-pilek yes))
=>
(printout t "Apakah anda memiliki Pneumonia, Bronkhitis atau sesak napas [yes/no]? ")
(assert (sesak-napas(read))))

(defrule ada-sesak
(and (gejala-demam yes)
(ada-batuk-pilek yes)
(sesak-napas no))
=>
(printout t "Sepertinya anda memiliki Flu biasa. Jangan lupa memakai masker, jaga kebersihan, dan beristirahat " crlf)
(assert (kondisi-flu yes)))

(defrule ada-sesak-napas
(and (gejala-demam yes)
(ada-batuk-pilek yes)
(sesak-napas yes))
=>
(printout t "Apakah anda memiliki riwayat perjalanan di negara dominan terjangkit (China dan Korea Selatan)[yes/no]? ")
(assert (perjalanan-terakhir(read))))

(defrule terduga-covid
(and (gejala-demam yes)
(ada-batuk-pilek yes)
(sesak-napas yes)
(perjalanan-terakhir no))
=>
(printout t "Kondisi anda akan dipantau dalam 2 minggu kedepan. Harap tinggal dirumah dan hindari kontak dengan siapapun " )
(printout t crlf "Hotline Corona Virus di Indonesia : 021-5210411 atau 081212123119" )
(assert (ada-dugaan(read))))


(defrule riwayat-kontak
(and (gejala-demam yes)
(ada-batuk-pilek yes)
(sesak-napas yes)
(perjalanan-terakhir yes))
=>
(printout t "Apakah anda menduga adanya kontak dengan pasien terjangkit COVID-19 dalam kurun waktu 2 minggu terakhir [yes/no]? ")
(assert (ada-kontak(read))))

(defrule berpotensi
(and (gejala-demam yes)
(ada-batuk-pilek yes)
(sesak-napas yes)
(perjalanan-terakhir yes)
(ada-kontak no))
=>
(printout t "Anda diharuskan mengikuti isolasi untuk pemeriksaan lanjut Harap ikuti arahan petugas dengan teratur" crlf)
(printout t "Hotline Corona Virus di Indonesia : 021-5210411 atau 081212123119" crlf)
(assert (diduga-ada-covid)))

(defrule sangat-tinggi
(and (gejala-demam yes)
(ada-batuk-pilek yes)
(sesak-napas yes)
(perjalanan-terakhir yes)
(ada-kontak yes))
=>
(printout t "Anda beresiko sangat tinggi terjangkit COVID-19 Silahkan ikuti arahan petugas untuk pemantauan/isolasi dan pemeriksaan lanjut ")
(printout t crlf"Hotline Corona Virus di Indonesia : 021-5210411 atau 081212123119" crlf)
(assert (ada-kontak(read))))
 