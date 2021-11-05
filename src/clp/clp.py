import clips
import logging

class Clips:
  def __init__(self) -> None:
      self.env = clips.Environment()

      log_format = '%(asctime)s - %(levelname)s - %(message)s'
      logging.basicConfig(level=logging.INFO, format=log_format)
      logger = clips.LoggingRouter()
      
      self.env.add_router(logger)
      self.env.reset()
  
  def load(self):
    self.env.load("./auto_repair.CLP")

  def reset(self):
    self.env.reset()
  
  def run(self):
    self.env.run()

  def get_facts(self):
    return self.env.facts()
  
  def insert_facts(self, facts):
    for fact in facts:
      inserted_fact = self.env.assert_string(fact)
      self.env.write_router('stdout', 'New fact asserted: ', fact, '. ', '\n')

