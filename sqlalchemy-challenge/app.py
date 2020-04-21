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
Measurement = Base.classes.measurement
Station = Base.classes.station

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
    prcplist = []
    for date, precipitation in results: 
        prcp_dict = {}
        prcp_dict[date] = precipitation
        prcplist.append(prcp_dict)
    return jsonify(prcplist)

#Define what to do when user hits the /api/v1.0/stations route
@app.route("/api/v1.0/stations")
def stations():
    print('Station Data')

    #create session from Python to the DB 
    session= Session(engine)
    
    #query date & precipitation 
    stationresults = session.query(Station.name).all()
    session.close()

    #convert list of tuples into normal list
    station = list(np.ravel(stationresults))
    return jsonify(station)

#Define what to do when user hits the /api/v1.0/tobs route
@app.route("/api/v1.0/tobs")
def tobs():
    print('Tobs Data')

    #create session from Python to the DB 
    session= Session(engine)
    
    #query date & precipitation 
    tobsresults = session.query(Measurement.date, Measurement.tobs, Measurement.station).\
        filter(Measurement.station == "USC00519281").\
        filter(Measurement.date >= '2016-08-18').all()
    session.close()

    #convert list of tuples into normal list
    tobslist = []
    for tobs in tobsresults:
        t = tobs[-2] 
        tobslist.append(t)
    return jsonify(tobslist)

#Define what to do when user hits the /api/v1.0/<start> route
@app.route("/api/v1.0/<start>")
def start(start):
    print('start date temperatures')

    #create session from Python to the DB 
    session= Session(engine)
    
    #query date & precipitation 
    startressults = session.query(func.min(Measurement.tobs),func.max(Measurement.tobs),func.avg(Measurement.tobs)).\
        filter(Measurement.date >=start).all()
    session.close()

    #convert list of tuples into normal list
    startlist = []
    for min, max, avg in startressults:
        start_dict = {}
        start_dict["Min"] = min 
        start_dict["Max"] = max
        start_dict["Avg"] = avg
        startlist.append(start_dict)
    return jsonify(startlist)

#Define what to do when user hits the /api/v1.0/<start> route
@app.route("/api/v1.0/<start>/<end>")
def dates(start,end):
    print('start/end date temperatures')

    #create session from Python to the DB 
    session= Session(engine)
    
    #query date & precipitation 
    startendressults = session.query(func.min(Measurement.tobs),func.max(Measurement.tobs),func.avg(Measurement.tobs)).\
        filter(Measurement.date >=start).\
        filter(Measurement.date <=end).all()
    session.close()

    #convert list of tuples into normal list
    startendlist = []
    for min, max, avg in startendressults:
        startend_dict = {}
        startend_dict["Min"] = min 
        startend_dict["Max"] = max
        startend_dict["Avg"] = avg
        startendlist.append(startend_dict)
    return jsonify(startendlist)

if __name__ == "__main__": 
    app.run(debug=True)