# Surfs-Up
A SQL Alchemy Project for Hawaii weather

## Description
This project investigates a fictional trip to Hawaii in June 2017.  It analyzes fictional weather data for Hawaii collected at various weather stations to predict typical weather during said trip.  This is done in the Jupyter notebook, while a Flask app is also created that allows data calls from a SQLite database using SQLAlchemy and Flask.

## Approach and File Structure
 - SQLAlchemy in Python can be used to access SQL databases and allow data manipulation in Python using the Pandas package.
 - In this case, SQLAlchemy is used to access the sqlite database (hawaii.sqlite) in the Resources folder.  The two csv files hold the same data from the SQL database tables.
 - The manipulation and visualization is contained in [climate_starter.ipynb](climate_starter.ipynb).
 - Data visualization images generated in the notebook are saved in the images folder.
 - In [app.py](app.py), the Flask library is used to simulate the generation of api calls from a SQL database.  This application is run on the local host.
