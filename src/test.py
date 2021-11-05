from clp import Clips

clips = Clips()
clips.load("./clp/auto_repair.CLP")

input_facts = ['(gas_in_tank y)', '(gas_in_carburator y)',
  '(engine_turnover y)',
  '(slow_acc y)'
]

clips.insert_facts(input_facts)
clips.run()
facts = clips.get_problems()

for fact in facts:
  print(fact)