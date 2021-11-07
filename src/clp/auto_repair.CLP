; Rule permasalahan mesin
(defrule empty_fuel_tank_check
  (gas_in_tank n)
=> 
  (assert (empty_fuel y))
  (assert (problem Bensin mobil habis!))
  (assert (solution Isi bensin di pom bensin terdekat))
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
  (assert (problem Busi mobil bermasalah!))
  (assert (solution Ganti busi!))
  (printout t "Busi mobil bermasalah!" crlf)
)

(defrule battery_cables_check
  (engine_turnover n)
  (lights_on n)
=>
  (assert (battery_problem y))
  (assert (cables_problem y))
  (assert (problem Aki mobil bermasalah!))
  (assert (solution Cek kembali aki dan jika rusak ganti aki))
  (assert (problem Kabel mobil bermasalah!))
  (assert (solution Cek kembali kabel dan jika rusak ganti kabel))
  (printout t "Aki dan kabel mobil perlu diganti!" crlf)
)

(defrule starter_motor_check
  (engine_turnover n)
  (lights_on n)
=>
  (assert (starter_motor_problem y))
  (assert (problem Dinamo starter mobil bermasalah!))
  (assert (solution Cek kembali dinamo dan bawa ke bengkel))
  (printout t "Ada masalah pada motor!" crlf)
)

; Rule permasalahan ban
(defrule flat_tire_check
  (unbalanced_car y)
  (low_pressure y)
=>
  (assert (flat_tire y))
  (assert (problem Ban mobil kempes!))
  (assert (solution Ganti ban dengan ban serep))
  (printout t "Ban mobil kempes!" crlf)
)

; Rule permasalahan rem
(defrule brake_pad_check
  (squealing_sounds y)
=>
  (assert (worn_brake_pad y))
  (assert (problem Kampas rem mobil sudah habis!))
  (assert (solution Ganti kampas rem mobil))
  (printout t "Kampas rem sudah aus!" crlf)
)