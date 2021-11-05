from typing import List
import clips
import logging
import sys
import io

class Clips:
  def __init__(self) -> None:
      self.env = clips.Environment()

      log_format = '%(asctime)s - %(levelname)s - %(message)s'
      logging.basicConfig(level=logging.INFO, format=log_format)
      self.logger = clips.LoggingRouter()
      
      self.env.add_router(self.logger)
      self.env.reset()
  
  def load(self, path):
    self.env.load(path)

  def reset(self):
    self.env.reset()
  
  def run(self):
    self.env.run()

  def get_facts(self):
    return self.env.facts()

  def get_facts_as_strings(self):
    facts = self.env.facts()
    return map(lambda fact: str(fact), facts)
  
  def insert_facts(self, facts):
    for fact in facts:
      inserted_fact = self.env.assert_string(fact)
      self.env.write_router('stdout', 'New fact asserted: ', inserted_fact, '. ', '\n')
  
  def get_problems(self):
    facts = self.get_facts_as_strings()

    problems = filter(lambda fact: fact[1:8] == "problem", facts)
    return problems
  
  def get_solutions(self):
    facts = self.get_facts_as_strings()

    solutions = filter(lambda fact: fact[1:9] == "solution", facts)
    print(solutions)
    return solutions
