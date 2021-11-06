
from flask import Flask
from flask import render_template
from flask import request
from flask import session
from flask.helpers import url_for
from werkzeug.utils import redirect
from clp import Clips

app = Flask(__name__)
app.secret_key = "super secret key"
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
  return render_template('expert_system.html', questions=machine_questions)

@app.route("/questions/tire")
def menu2():
  tire_questions = [
    "Apakah mobil terasa tidak seimbang/bergoyang?", 
    "Apakah tekanan ban terasa lemah?"]
  return render_template('expert_system.html', questions=tire_questions)

@app.route("/questions/brake")
def menu3():
  brake_questions = ["Apakah terdengar bunyi menyelekit saat mengerem?"]
  return render_template('expert_system.html', questions=brake_questions)

@app.route("/send/answers", methods=['POST'])

def send_answers():
  session_list = []
  machine_questions = [
    "Apakah mobil terisi bensin?", 
    "Apakah bensin masuk ke karburator?", 
    "Apakah mobil bisa di-starter?", 
    "Apakah akselerasi mobil terasa lemah?", 
    "Apakah lampu mobil dapat menyala?"]
  tire_questions = [
    "Apakah mobil terasa tidak seimbang/bergoyang?", 
    "Apakah tekanan ban terasa lemah?"]
  brake_questions = ["Apakah terdengar bunyi menyelekit saat mengerem?"]
  mq = 0
  for question in machine_questions:
    if(request.form.get(question)== "yes" and mq == 0):
      session_list.append('(gas_in_tank y)')
    elif(request.form.get(question)== "no" and mq == 0):
      session_list.append('(gas_in_tank n)')
    elif(request.form.get(question)== "yes" and mq == 1):
      session_list.append('(gas_in_carburator y)')
    elif(request.form.get(question)== "no" and mq == 1):
      session_list.append('(gas_in_carburator n)')
    elif(request.form.get(question)== "yes" and mq == 2):
      session_list.append('(engine_turnover y)')
    elif(request.form.get(question)== "no" and mq == 2):
      session_list.append('(engine_turnover n)')
    elif(request.form.get(question)== "yes" and mq == 3):
      session_list.append('(slow_acc y)')
    elif(request.form.get(question)== "no" and mq == 3):
      session_list.append('(slow_acc n)')
    elif(request.form.get(question)== "yes" and mq == 4):
      session_list.append('(lights_on y)')
    elif(request.form.get(question)== "no" and mq == 4):
      session_list.append('(lights_on n)')
    mq += 1
    if(mq==5):
      mq = 0
  for qt in tire_questions:
    print(mq)
    if(request.form.get(qt)== "yes" and mq == 0):
      session_list.append('(unbalanced_car y)')
    elif(request.form.get(qt)== "no" and mq == 0):
      session_list.append('(unbalanced_car n)')
    elif(request.form.get(qt)== "yes" and mq == 1):
      session_list.append('(low_pressure y)')
    elif(request.form.get(qt)== "no" and mq == 1):
      session_list.append('(low_pressure n)')
    mq+=1
    if(mq==2):
      mq=0
  for qb in brake_questions:
    print(mq)
    if(request.form.get(qb)== "yes" and mq == 0):
      session_list.append('(squealing_sounds y)')
    elif(request.form.get(qb)== "no" and mq == 0):
      session_list.append('(squealing_sounds n)')
  session['facts'] = session_list
  for fact in session['facts'] :
    print(fact)

  #for question in questions:
    #if (request.form[question] == yes or 
  #print(request.form["uhuy"])
  #if (request.form['blabla'] == "on"):
    #"facts".append("(unbalanced car y)")
  # for fact in facts:

  #print(request.form['blabla'], request.form['uhuy'])
  return redirect("../conclusion")

@app.route("/conclusion")
def hasil():
  clips = Clips()

  facts = session.get("facts", None)
  clips.load("./clp/auto_repair.CLP")
  clips.insert_facts(facts)
  clips.run()

  problems = clips.get_problems()
  solutions = clips.get_solutions()
  
  return render_template("conclusion.html", problems=problems, solutions=solutions)