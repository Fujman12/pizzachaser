from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField, RadioField
from wtforms import validators
from wtforms.validators import Required,DataRequired


class ReviewForm(FlaskForm):
    name = StringField('What is your name?', validators=[DataRequired()])
    review_field = TextAreaField(validators=[DataRequired()])
    radio = RadioField('Label', choices=[('1','1'),('2','2'),('3','3'),('4','4'),('5','5')],validators=[DataRequired()])
    submit = SubmitField('Submit')
