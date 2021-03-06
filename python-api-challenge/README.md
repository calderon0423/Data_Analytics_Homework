# Weather By Latitude
Visualization global weather patterns by latitude

An analysis of weather patterns using python, the OpenWeatherMap API, and CityPy to visualize trends in temperature, humidity, cloudiness, and windiness by latitude.

## Analysis
- Average temperature generally increases the closer a location is to the equator
- The variance of temperature ranges appears to increase the further a location is from the equator. Average temperatures for locations within ~5 degrees of the equator only vary by about 20 degrees Fahrenheit, while temperatures around 70 degress latitude vary from about -30 degrees to 35 degress Fahrenheit.
- Their are not strongly discernable trends between latitude and humidity, cloudiness, and windiness. However there may be a loose correlation between increased humidity at higher latitudes and increased windiness further from the equator.

Note: For this analysis I used the OpenWeatherMap APIs 5 day forecast to ensure that temperatures and other data points were averaged out for all times of day. Ideally historical data would be used, but that data is only available at a cost. Using the historical weather data may be a future improvement.

## Approach and File Structure
 - The manipulation and visualization is contained in [WeatherPy.ipynb](jupyter_notebooks/WeatherPy.ipynb).
