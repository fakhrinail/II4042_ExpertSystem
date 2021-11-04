import logging
import os

log_format = '%(asctime)s - %(levelname)s - %(message)s'
logging.basicConfig(level=logging.INFO, format=log_format)

env = clips.Environment()
env.load("./clp/auto_repair.CLP")
env.reset()

router = clips.LoggingRouter()
env.add_router(router)

input_facts = ['(chosen_menu 1)']

for input in input_facts:
  fact = env.assert_string(input)
  env.write_router('stdout', 'New fact asserted: ', fact, '. ', '\n')

for fact in env.facts():
  print(fact)

env.run()

for fact in env.facts():
  print(fact)