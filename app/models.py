from . import db



class Restaurant(db.Model):
    __tablename__ = 'restaurants'
    id = db.Column(db.Integer, primary_key=True, nullable = False)
    name = db.Column(db.String(80), index = True, nullable = False)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.id'), nullable = False)
    country_id = db.Column(db.Integer, db.ForeignKey('countries.id'), nullable = False)
    state_id = db.Column(db.Integer, db.ForeignKey('states.id'), nullable = True)
    address = db.Column(db.String(150), nullable = False)
    url = db.Column(db.String(520),nullable = True)

    reviews = db.relationship('Review', backref='restaurant', lazy='dynamic')

    def serialize(self):
        return {
            'name': self.name,
            'address': self.address,
            'url': self.url
        }

class Review(db.Model):
    __tablename__ = 'reviews'
    id = db.Column(db.Integer, primary_key=True, nullable = False)
    points = db.Column(db.Integer,nullable = False)
    text = db.Column(db.String(280), nullable = False)
    user = db.Column(db.String(30), nullable = False)
    restaurant_id = db.Column(db.Integer, db.ForeignKey('restaurants.id'), nullable = False)
    username = db.Column(db.String(30),nullable = False)

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
