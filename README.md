# Fit-Bite

## Context
 There are thousands of pet owners around the world, who are forced to leave their pets alone, when they leave for work every day. These owners are anxious about how their pets are doing, till the time they get back home. What would help is this situation is a pet monitoring solution, which monitors the health of the pet, and can predict the pet’s health, and can also alert the pet owners in case there appears to be any variations in their pet’s normal metric (like temperature, sound intensity etc) trends. 
 
 
This solution is a prototype which monitors pet parameters like temperature, humidity, sound intensity via sensors and the pets past history gathered from its visit to the veterinarian, and then predicts the probability of the pet falling sick in the near future. In the current version, pet owners can interact with the prediction engine, using the PetBot chat bot. The owner can also request for the most recent pet snaps via this interaction. The Solution can also send proactive alerts to the chat channel when values of parameters like sound intensity goes beyond the normal trends for the pet.


## Solution Overview
![Solution Overview](https://raw.githubusercontent.com/maniSbindra/fit-bite/master/Solution%20Overview/fit-bite-solution-overview.jpg "Solution Overview")


## Solution Software Components
* Fit-Bite Sensor Prototype - Core IOT UWP Application which sends the pet images to azure blog storage, and the Pet metrics to IOT hub. For details please refer https://github.com/gsamant/FitBite 
* Fit-Bite Sensor Prototype - Sound Intensity REST API : This is a python rest API, which gives the soundIntensity at the time of the api being invoked. It is build on the dexter industries BrickpI library (which allows us to use Lego mindstorm sensors on a raspberry pi). The python code can be found at https://github.com/maniSbindra/fit-bite/tree/master/sound-api
* Stream Analytics Job - For details please refer https://github.com/PoonamSampat/PetByte
* PetBot - This is the chat bot which pet owners interact with, to get details like predicted health of pet, or latest snap of the pet. For details of please refer https://github.com/maniSbindra/fit-bite/tree/master/petBot
* ML Service : This is the service which can predict the health of a pet in the near future. For Details Please Refer https://github.com/maniSbindra/fit-bite/tree/master/ML
* Check Pet Health Azure Function is the function which is invoked by the chat bot when the pet owner requests for current health of the pet. This function in turn invokes the ML Service. For details please refer https://github.com/PoonamSampat/PetByte
* Sound Intensity threshold breach alert function, is a scheduled function which checks whether the sound intensity levels for a pet in the last few seconds have breached the normal sound intesity levels, and sends a message to the pet owner in the configured slack channel. For details please refer https://github.com/PoonamSampat/PetByte
  