; Rule permasalahan mesin
(defrule empty_fuel_tank_check
  (gas_in_tank n)
=> 
  (assert (empty_fuel y))
  (printout t "Bensin mobil kamu habis!" crlf)
  (printout t "Isi bensin di pom bensin terdekat" crlf)
)

(defrule engine_getting_gas_check
  (gas_in_tank y)
  (gas_in_carburator y)
=>
  (assert (engine_getting_gas y))
  (printout t "Mesin berasap" crlf)
)

(defrule spark_plugs_check
  (engine_getting_gas y)
  (engine_turnover y)
  (slow_acc y)
=>
  (assert (spark_plugs y))
  (printout t "Busi mobil bermasalah!" crlf)
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
(defrule flat_tire_check
  (unbalanced_car y)
  (low_pressure y)
=>
  (assert (flat_tire y))
  (printout t "Ban mobil kempes!" crlf)
)

; Rule permasalahan rem
(defrule brake_pad_check
  (squealing_sounds y)
=>
  (printout t "Kampas rem sudah aus!" crlf)
  (assert (worn_brake_pad y))
)