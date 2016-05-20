# Fit-Bite

## Context

## Solution Overview
![Solution Overview](https://raw.githubusercontent.com/maniSbindra/fit-bite/master/Solution%20Overview/fit-bite-solution-overview.jpg "Solution Overview")

## Solution Software Components
* Fit-Bite Sensor Prototype - Core IOT UWP Application. For details please refer https://github.com/gsamant/FitBite 
* Fit-Bite Sensor Prototype - Sound Intensity REST API : This is a python rest API, which gives the soundIntensity at the time of the api being invoked. It is build on the dexter industries BrickpI library (which allows us to use Lego mindstorm sensors on a raspberry pi)
* Stream Analytics Job - For details please refer https://github.com/PoonamSampat/PetByte
* PetBot - This is the chat bot which pet owners interact with, to get details like predicted health of pet, or latest snap of the pet. For details of please refer https://github.com/maniSbindra/fit-bite/tree/master/petBot
* ML Service
* Check Pet Health Azure Function for details please refer https://github.com/PoonamSampat/PetByte
* Sound Intensity threshold breach alert function for details please refer https://github.com/PoonamSampat/PetByte
  