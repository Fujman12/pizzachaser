from flask import render_template, session, redirect, url_for, current_app,request
from .. import db
from ..models import City, Restaurant,State,Country,Review
from ..email import send_email
from . import main
from .forms import ReviewForm, OwnForm
from flask import jsonify
from flask import flash
import sys
import json
from decimal import *


@main.route('/', methods=['GET', 'POST'])
def index():
    states = State.query.all();

    country_uk=Country.query.filter_by(name='United Kingdom').first()
    country_ca = Country.query.filter_by(name = 'Canada').first()
    uk_cities = country_uk.cities.all()
    ca_cities = country_ca.cities.all()

    return render_template('index.html',states = states,uk_cities = uk_cities,ca_cities =ca_cities )

@main.route('/country/<country_name>')
def country(country_name):

    if country_name.upper() == 'USA':
        states = State.query.all();
        return render_template('country_states.html',states = states,Country= 'USA')
    else:
        current_country = Country.query.filter_by(name = country_name).first()
        cities_in_country =  current_country.cities.all()
        return render_template('country_cities.html', Country= country_name, cities= cities_in_country)

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

@main.route('/city/<region>/<city_name>/')
def city(region,city_name):
    #state = request.args.get('state')
    #country = request.args.get('country')
    #region = None
    #if state == None:
#        region = country
    #else:
    #    region = state
    current_city = City.query.filter_by(name = city_name).first()
    rests_in_city = current_city.restaurants.all()
    new_rests = []
    for rest in rests_in_city:
        reviews = rest.reviews.all()
        summ = Decimal(0)
        avg = Decimal(0)

        count = len(reviews)
        if count == 0:
            count = 1
        for review in reviews:
            summ += Decimal(review.points)
        avg = Decimal(summ/count)
        new_rest = {'id':rest.id,'name':rest.name,'address':rest.address,'avg':avg}
        new_rests.append(new_rest)
    return render_template('city.html',city_name = city_name,region = region,rests_in_city = new_rests)

@main.route('/pizza_restaurant/<id>', methods=['GET', 'POST'])
def pizza_restaurant(id):


    restaurant= Restaurant.query.filter_by(id = id).first()
    form = ReviewForm()
    reviews = Review.query.filter_by(restaurant = restaurant).all()
    if form.validate_on_submit():
        points = form.radio.data
        flash('Your review has been added succesfully! You gave %s point(s).'% points)

        review = Review(points = form.radio.data,user =  form.name.data, text = form.review_field.data,restaurant = restaurant)
        db.session.add(review)
        db.session.commit()
        return  redirect(url_for('main.pizza_restaurant', id = restaurant.id))
    if request.method == 'POST':
        flash('Wrong input.Please make sure you\'ve entered your name, review and points')
    return render_template('restaurant.html',restaurant = restaurant, form = form,  reviews = reviews)

@main.route('/own_a_restaurant',methods=['GET', 'POST'])
def own_a_restaurant():
    form = OwnForm()
    city = None
    state = None
    country = None
    if form.validate_on_submit():
        country = Country.query.filter_by(name = form.country.data).first()
        if  country != None:
            #state = State.query.filter_by(name = form.state.data).first()
            #if state == None:
            #    flash('Wrong state!Please make sure you\'ve entered correct USA state name')
            #    return  redirect(url_for('main.own_a_restaurant'))
            state = State.query.filter_by(name = form.state.data).first()

            if state != None:
                city = state.cities.filter_by(name = form.city.data).first()
                if city != None:
                    country = Country.query.filter_by(name = "USA").first()
                    rest = Restaurant(name = form.name_of_rest.data, country = country, state = state, city =  city, address = form.address.data)
                    db.session.add(rest)
                    db.session.commit()
                    flash('Your Restaurant succesfully added! Thank you!')
                    return  redirect(url_for('main.own_a_restaurant'))
                else:
                    flash('Wrong city name')
                    return  redirect(url_for('main.own_a_restaurant'))

            if state == None:
                city = country.cities.filter_by(name = form.city.data).first()

                if city != None:

                    rest = Restaurant(name = form.name_of_rest.data,country = country, city =  city, address = form.address.data)
                    db.session.add(rest)
                    db.session.commit()
                    flash('Your Restaurant succesfully added! Thank you!')
                    return  redirect(url_for('main.own_a_restaurant'))
                else:
                    flash('Wrong city name')
                    return  redirect(url_for('main.own_a_restaurant'))

        else:
            flash('Wrong country!Please make sure you\'ve entered correct country name')

        return  redirect(url_for('main.own_a_restaurant'))
    if request.method == 'POST':
        flash('Wrong input! Please fill out the required data fields ')
    return render_template('own.html', form = form)

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
    if current_city == None:
        return None;
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


#Google verification
@main.route('/google3438b6f6e785c5f8.html', methods=['GET','POST'])
def google():
    return render_template('google3438b6f6e785c5f8.html')

@main.route('/BingSiteAuth.xml', methods=['GET','POST'])
def bing():
    return render_template('BingSiteAuth.xml')

@main.route('/bingsiteauth.xml', methods=['GET','POST'])
def bing():
    return render_template('BingSiteAuth.xml')
