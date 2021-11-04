
from flask import Flask
from flask import render_template
from flask import request

app = Flask(__name__)

@app.route("/")
def index():
  return render_template('index.html')

@app.route("/questions/machine")
def menu1():
  machine_questions = [
    "Apakah mobil terisi bensin?", 
    "Apakah bensin masuk ke karburator?", 
    "Apakah mobil bisa di-starter?", 
    "Apakah akselerasi mobil terasa lemah?", 
    "Apakah lampu mobil dapat menyala?"]
  machine_facts = []
  return render_template('expert_system.html', questions=machine_questions)

@app.route("/questions/tire")
def menu2():
  tire_questions = [
    "Apakah mobil terasa tidak seimbang/bergoyang?", 
    "Apakah tekanan ban terasa lemah?"]
  tire_facts = []
  return render_template('expert_system.html', questions=tire_questions)

@app.route("/questions/brake")
def menu3():
  brake_questions = ["Apakah terdengar bunyi menyelekit saat mengerem?"]
  brake_facts = []
  return render_template('expert_system.html', questions=brake_questions)

@app.route("/answers", methods=['POST'])
def answers():
  facts = []
  if (request.form['blabla'] == "on"):
    facts.append("(unbalanced car y)")
  # for fact in facts:

  print(request.form['blabla'], request.form['uhuy'])

@app.route("/conclusion")
def hasil():
  return render_template("")