import logging

def logger():
  log_format = '%(asctime)s - %(levelname)s - %(message)s'
  logger = logging.basicConfig(level=logging.INFO, format=log_format)