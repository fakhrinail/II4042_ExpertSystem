; Rule permasalahan mesin
(defrule gas_check
  (chosen_menu 1)
=>
  (printout t "Apakah mobil terisi bensin? (y/n)" crlf)
  (assert (gas_in_tank (read)))
  (printout t "Apakah bensin masuk ke karburator? (y/n)" crlf)
  (assert (gas_in_carburator (read)))
)

(defrule empty_fuel_tank_check
  (gas_in_tank n)
=> 
  (printout t "Bensin mobil kamu habis!" crlf)
  (printout t "Isi bensin di pom bensin terdekat" crlf)
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
  (printout t "Apakah mobil bisa di-starter? (y/n)" crlf)
  (assert (engine_turnover (read)))
)

(defrule slow_acc_check
  (gas_in_tank y)
  (engine_turnover y)
=> 
  (printout t "Apakah akselerasi mobil terasa lemah?" crlf)
  (assert (slow_acc (read)))
)

(defrule spark_plugs_check
  (engine_getting_gas y)
  (engine_turnover y)
  (slow_acc y)
=>
  (assert (spark_plugs y))
  (printout t "Busi mobil bermasalah!" crlf)
)

(defrule lights_check
  (gas_in_tank y)
=>
  (printout t "Apakah lampu mobil dapat menyala? (y/n)" crlf)
  (assert (lights_on (read)))
  )

(defrule battery_cables_check
  (engine_turnover false)
  (lights_on false)
=>
  (assert (battery_problem y))
  (assert (cables_problem y))
  (printout t "Aki dan kabel mobil perlu diganti!" crlf)
)

(defrule starter_motor_check
  (engine_turnover false)
  (lights_on false)
=>
  (assert (starter_motor_problem y))
  (printout t "Ada masalah pada motor!" crlf)
)

; Rule permasalahan ban
(defrule car_balance_check
  (chosen_menu 2)
=>
  (printout t "Apakah mobil terasa tidak seimbang/bergoyang? (y/n)" crlf)
  (assert (unbalanced_car (read)))
)

(defrule tire_pressure_check
=>
  (printout t "Apakah tekanan ban terasa lemah? (y/n)" crlf)
  (assert (low_pressure (read)))
)

(defrule flat_tire_check
  (unbalanced_car y)
  (low_pressure y)
=>
  (assert (flat_tire y))
  (printout t "Ban mobil kempes!" crlf)
)

; Rule permasalahan rem
(defrule brake_sound_check
  (chosen_menu 3)
=>
  (printout t "Apakah terdengar bunyi menyelekit saat mengerem? (y/n)" crlf)
  (assert (squealing_sounds (read)))
)

(defrule brake_pad_check
  (squealing_sounds y)
=>
  (printout t "Kampas rem sudah aus!" crlf)
  (assert (worn_brake_pad y))
)