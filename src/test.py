from clp import Clips

clips = Clips()
clips.load()

input_facts = ['(gas_in_tank y)', '(gas_in_carburator y)']

clips.insert_facts(input_facts)
clips.run()
facts = clips.get_facts()

for fact in facts:
  print(fact, "\n")