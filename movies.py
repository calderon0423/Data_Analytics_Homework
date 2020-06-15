from flask import Flask, request, jsonify
import sqlalchemy
from sqlalchemy.ext.automap import automap_base

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Float

from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import os 

#db setup

#Base = declarative_base()

#database_path = "/Users/lars/Documents/Github/project2lars/all_netflix.sqlite"
engine = create_engine("sqlite:///all_netflix.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)
# Save reference to the table
Movie=Base.classes.movie

#class Movie(Base):
#    __tablename__= 'movies'
#    id=Column(Integer, primary_key=True)
#    title=Column(String)
#    type=Column(String)
#    director=Column(String)
#    cast=Column(String)
#    country=Column(String)
#    release_year=Column(String)
#    date_added=Column(String)
#    rating=Column(String)
#    genre=Column(String)

#Base.metadata.create_all(engine)
app = Flask(__name__)



#instance our webapp (sql_flask)
#basedir=os.path-abspath(os.path.dirname(__file__))
#app.config['SQLALCHEMY_DATABASE_URL']='sqlite:///' + 
#os.path.join(basedir, 'crud.sqlite')
#bind database
#db=SQLAlchemy(app)
#ma=Marshmallow(app)


#@app.route("/", methods=["GET'"])
#def index():
    #display welcome
    #explain how to use site
#    return render_template(index.html)

@app.route("/movies/", methods=["GET"])
def movies():
    session = Session(engine)

    entries=session.query(Movie.title, Movie.director).all()
    
    session.close()
    all_entries = []
    for m in entries:
        movies_dict = {m.title:{m.director:r.release_year}}
        all_entries.append(movies_dict)

    return jsonify(all_entries)

@app.route("/movies/<moviename>/", methods=["GET"])
def movie_name(moviename):
    session = Session(engine)

    session.close()
    return
    #return jsonify(session.query(Movie.title, Movie.director, Movie.release_year).\
        #filter(Movie.title == moviename).all())
        #add other fields 

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')