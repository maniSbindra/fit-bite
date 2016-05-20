# fit-bite
This has the code for the slack pet bot and the sound intensity api, which are components of the fit-bite solutions

## The main application logic file is petBotModules/petBot.coffee

## Pet Bot Configuration : Following environment variables need to be set
* SLACK_BOT_TOKEN : Bot custom integration token from slack
* AZURE_STORAGE_ACCOUNT_BASE_URL : THe Base url of the Azure Storage account
* AZURE_STORAGE_ACCOUNT_NAME : Azure Storage account name
* AZURE_STORAGE_CONTAINER_NAME : Azure Container Name
* AZURE_STORAGE_ACCOUNT_ACCESS_KEY : Azure Storage account access key

## Usage
#### Note : Currently there is no NLP / LUIS integration!
#### Typing "show me tom" in the slack channel where the BOT has been invited to will display the most recent image from the container
#### Typing "show me tom" in the slack channel where the BOT has been invited to will display the current health prediction for the pet (using machine learning service). Integration with the machine learning service is currently pending.


## This demo has been built using Node Slack Client
## Node.js Slack Client Library
## node-slack v2.0.0 please read!