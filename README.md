# fit-bite
fit-bite pet monitoring system.
This has the code for the slack pet bot and the sound intensity api 

## Pet Bot Configuration : Following environment variables need to be set
1. SLACK_BOT_TOKEN : Bot custom integration token from slack
2. AZURE_STORAGE_ACCOUNT_BASE_URL : THe Base url of the Azure Storage account
3. AZURE_STORAGE_ACCOUNT_NAME : Azure Storage account name
4. AZURE_STORAGE_CONTAINER_NAME : Azure Container Name
5. AZURE_STORAGE_ACCOUNT_ACCESS_KEY : Azure Storage account access key

## Usage
#### Note : Currently there is no NLP / LUIS integration!
#### Typing "show me tom" in the slack channel where the BOT has been invited to will display the most recent image from the container
#### Typing "show me tom" in the slack channel where the BOT has been invited to will display the current health prediction for the pet (using machine learning service). Integration with the machine learning service is currently pending.

