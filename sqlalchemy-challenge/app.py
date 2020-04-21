#import Dependencies
import numpy as np 
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

#Database Setup 
engine = create_engine("sqlite:///Resources/hawaii.sqlite")
#reflect an existing DB into a new model 
Base = automap_base()
#reflect the tables 
Base.prepare(engine, reflect =True)
#save the ref to the table 
Measurement = Base.classes.Measurement

#create an app
app = Flask(__name__)

#Define action when user hits index route 
@app.route("/")
def home():
    print('Home Page')
    return (
        f"Available Routes:<br/>"
        f"/api.v1.0/precipitation</br>"
        f"/api/v1.0/stations</br>"
        f"/api/v1.0/tobs</br>"
        f"/api/v1.0/<start></br>"
        f"/api/v1.0/<start>/<end>"
    )


#Define what to do when user hits the /api.v1.0/precipitation route
@app.route("/api.v1.0/precipitation")
def precipitation():
    print('Precipitation Data')

    #create session from Python to the DB 
    session= Session(engine)
    
    #query date & precipitation 
    results = session.query(Measurement.date, Measurement.prcp).all()
    session.close()

    #convert lisst of tuples into normal list
    precipitation = list(np.ravel(results))
    return jsonify(precipitation)


if __name__ == "__main__": 
    app.run(debug=True)