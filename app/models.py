from . import db
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from . import login_manager

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class Restaurant(db.Model):
    __tablename__ = 'restaurants'
    id = db.Column(db.Integer, primary_key=True, nullable = False)
    name = db.Column(db.String(80), index = True, nullable = False)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.id'), nullable = False)
    country_id = db.Column(db.Integer, db.ForeignKey('countries.id'), nullable = False)
    state_id = db.Column(db.Integer, db.ForeignKey('states.id'), nullable = True)
    address = db.Column(db.String(150), nullable = False)
    url = db.Column(db.String(520),nullable = True)
    phone = db.Column(db.String(30), nullable = True)
    published = db.Column(db.Boolean, default = True, nullable = False)

    reviews = db.relationship('Review', backref='restaurant', lazy='dynamic')

    def serialize(self):
        return {
            'name': self.name,
            'address': self.address,
            'url': self.url,
            'id': self.id
        }

class Review(db.Model):
    __tablename__ = 'reviews'
    id = db.Column(db.Integer, primary_key=True, nullable = False)
    points = db.Column(db.Integer,nullable = False)
    text = db.Column(db.VARCHAR(280), nullable = False)
    user = db.Column(db.String(30), nullable = False)
    restaurant_id = db.Column(db.Integer, db.ForeignKey('restaurants.id'), nullable = False)
    #username = db.Column(db.String(30),nullable = False, default=None)
    published = db.Column(db.Boolean, default = True, nullable = False)

class City(db.Model):
    __tablename__ = 'cities'
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    name = db.Column(db.String(25), nullable = False, index = True)
    country_id = db.Column(db.Integer, db.ForeignKey('countries.id'), nullable = False)
    state_id = db.Column(db.Integer, db.ForeignKey('states.id'), nullable = True)
    restaurants = db.relationship('Restaurant', backref='city', lazy='dynamic')

class Country(db.Model):
    __tablename__ = 'countries'
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    name = db.Column(db.String(20), nullable = False, index = True)
    restaurants = db.relationship('Restaurant', backref='country', lazy='dynamic')
    cities = db.relationship('City', backref='country', lazy='dynamic')

class State(db.Model):
    __tablename__ = 'states'
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    name = db.Column(db.String(25), nullable = False, index = True)
    cities = db.relationship('City', backref='state', lazy='dynamic')
    restaurants = db.relationship('Restaurant', backref='state', lazy='dynamic')

class User(UserMixin, db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    name = db.Column(db.String(25), nullable = False, index = True)

    password_hash = db.Column(db.String(128))

    @property
    def password(self):
        raise AttributeError('password is not a readable attribute')

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)
