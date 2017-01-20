from flask import render_template, session, redirect, url_for, current_app,request
from .. import db
from ..models import City, Restaurant,State,Country
from ..email import send_email
from . import main
from .forms import NameForm
from flask import jsonify
import sys
import json

@main.route('/', methods=['GET', 'POST'])
def index():
    states = State.query.all();

    return render_template('index.html',states = states)

@main.route('/country/<country_name>')
def country(country_name):

    if country_name.upper() == 'USA':
        states = State.query.all();
        return render_template('country_states.html',states = states,Country= 'USA')
    else:
        #current_country = Country.query.filter_by(name = country_name).first()
        #cities_in_country =  current_country.cities.all()
        return render_template('country_cities.html', Country= country_name)

@main.route('/state/<state>')
def state(state):

    #current_state = State.query.filter_by(state).first()
    #current_state.cities.all()
    try:
        _state = State.query.filter_by(name = state).first()
        cities = _state.cities.all()
    except Exception as e:
        pass

    return render_template('state.html',state = state,cities = cities)

@main.route('/city/<city_name>/')
def city(city_name):
    state = request.args.get('state')
    country = request.args.get('country')
    region = None
    if state == None:
        region = country
    else:
        region = state
    #current_city = City.query.filter_by(name = current_city).first()
    #rests_in_city = current_city.restaurants.all()

    return render_template('city.html',city_name = city_name,region = region)

@main.route('/pizza_restaurant/<restaurant_name>')
def pizza_restaurant(restaurant_name):
    current_restaurant= Restaurant.query.filter_by(name = restaurant_name).first()

    return render_template('restaurant.html')

@main.route('/map',methods=['GET', 'POST'])
def map():

	return render_template('map.html')

@main.route('/result', methods=['GET','POST'])
def result():

    dictionary1 = {'a':1, 'b':2}
    dictionary2 = {'asd':2, 'b':3,"narek":"krasava"}
    s =[]
    s.append(dictionary1.copy())
    s.append(dictionary2.copy())
    #print('Hello world!')
    #print('Hello world!', file=sys.stderr)

    return jsonify(result = s)


@main.route('/rests_in_city', methods=['GET','POST'])
def rests_in_city():
    name = request.form['name']

    current_city = City.query.filter_by(name = name).first()
    rests_in_city = current_city.restaurants.all()

    return jsonify(result = [e.serialize() for e in rests_in_city])
    #return None
@main.route('/rests_in_country', methods=['GET','POST'])
def rests_in_country():
    name = request.form['name']

    current_country = Country.query.filter_by(name = name).first()

    rests_in_country = current_country.restaurants.all()

    #return 'Blah'
    return jsonify(result = [e.serialize() for e in rests_in_country])

@main.route('/rests_in_state', methods=['GET','POST'])
def rests_in_state():
    name = request.form['name']

    current_state = State.query.filter_by(name = name).first()
    rests_in_state = current_state.restaurants.all()

    return jsonify(result = [e.serialize() for e in rests_in_state])
