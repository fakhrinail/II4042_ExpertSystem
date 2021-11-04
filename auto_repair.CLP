; Fakta awal
(deffacts initial_state
  (found_problem n)
)

; Rule menu
(defrule banner
  (declare (salience 10))
=>  
  (printout t crlf crlf)
  (printout t "Sistem Pakar untuk diagnosis mobil")
  (printout t crlf crlf)
)

(defrule menu
  (declare (salience 5))
=>
  (printout t "Pilih komponen yang ingin diperiksa:")
  (printout t "1. Mesin")
  (printout t "2. Ban")
  (printout t "3. Rem")
  (printout t "Masukkan angka antara 1-3")
  (assert (chosen_menu (read)))
)

; Rule permasalahan mesin
(defrule gas_check
  (chosen_menu 1)
=>
  (printout t "Apakah mobil terisi bensin? (y/n)")
  (assert (gas_in_tank (read)))
  (printout t "Apakah bensin masuk ke karburator? (y/n)")
  (assert (gas_in_carburator (read)))
)

(defrule empty_fuel_tank_check
  (gas_in_tank n)
=> 
  (printout t "Bensin mobil kamu habis!")
  (printout t "Isi bensin di pom bensin terdekat")
)

(defrule engine_getting_gas_check
  (gas_in_tank y)
  (gas_in_carburator y)
=>
  (assert (engine_getting_gas y))
)

(defrule engine_turnover_check
  (gas_in_tank y)
=> 
  (printout t "Apakah mobil bisa di-starter? (y/n)")
  (assert (engine_turnover (read)))
)

(defrule slow_acc_check
  (gas_in_tank y)
  (engine_turnover y)
=> 
  (printout t "Apakah akselerasi mobil terasa lambat? (y/n)")
  (assert (slow_acc (read)))
)

(defrule spark_plugs_check
  (engine_getting_gas y)
  (engine_turnover y)
  (slow_acc y)
=>
  (assert (found_problem y))
  (assert (spark_plugs y))
  (printout t "Busi mobil bermasalah!")
)

(defrule battery_cables_check
  (engine_turnover false)
  (lights_on false)
=>
  (assert (found_problem y))
  (assert (battery y))
  (assert (cables y))
)

(defrule starter_motor_check
  (engine_turnover false)
  (lights_on false)
=>
  (assert (found_problem y))
  (assert (starter_motor y))
)


; Rule permasalahan ban
(defrule flat_tire_check
  (unbalanced_car y)
  (low_pressure y)
=>
  (assert (flat_tire y))
)

; Rule permasalahan rem
(defrule brake_pad_check
  (squealing_sounds y)
=>
  (assert (worn_brake_pad y))
)