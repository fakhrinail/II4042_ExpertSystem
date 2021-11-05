
from flask import Flask
from flask import render_template
from flask import request
from flask import session
from flask.helpers import url_for
from werkzeug.utils import redirect
from clp import Clips

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

@app.route("/send/answers", methods=['POST'])
def send_answers():
  session['facts'] = [] # facts dr form masukin sini nanti
  if (request.form['blabla'] == "on"):
    facts.append("(unbalanced car y)")
  # for fact in facts:

  print(request.form['blabla'], request.form['uhuy'])
  return redirect(url_for('/conclusion'))

@app.route("/conclusion")
def hasil():
  facts = session.get("facts", None)
  return render_template("")