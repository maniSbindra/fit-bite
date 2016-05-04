Slack = require '..'
request = require 'request'
azureStorage = require 'azure-storage'

storageAccountBaseUrl = process.env.AZURE_STORAGE_ACCOUNT_BASE_URL
storageContainerName = process.env.AZURE_STORAGE_CONTAINER_NAME

token = process.env.SLACK_BOT_TOKEN 
autoReconnect = true
autoMark = true

slack = new Slack(token, autoReconnect, autoMark)

slack.on 'open', ->
  channels = []
  groups = []
  unreads = slack.getUnreadCount()

  # Get all the channels that bot is a member of
  channels = ("##{channel.name}" for id, channel of slack.channels when channel.is_member)

  # Get all groups that are open and not archived 
  groups = (group.name for id, group of slack.groups when group.is_open and not group.is_archived)

  console.log "Welcome to Slack. You are @#{slack.self.name} of #{slack.team.name}"
  console.log 'You are in: ' + channels.join(', ')
  console.log 'As well as: ' + groups.join(', ')

  messages = if unreads is 1 then 'message' else 'messages'

  console.log "You have #{unreads} unread #{messages}"


slack.on 'message', (message) ->
  channel = slack.getChannelGroupOrDMByID(message.channel)
  user = slack.getUserByID(message.user)
  response = ''

  {type, ts, text} = message

  channelName = if channel?.is_channel then '#' else ''
  channelName = channelName + if channel then channel.name else 'UNKNOWN_CHANNEL'

  userName = if user?.name? then "@#{user.name}" else "UNKNOWN_USER"
  userEmail = if user?.name? then "@#{user.profile.email}" else "UNKNOWN_EMAIL"
  
  console.log "User Email : #{userEmail}"

  console.log """
    Received: #{type} #{channelName} #{userName} #{ts} "#{text}"
  """
  
  
  # The regular expression to check if pet health status is being asked for in the message. Currently regular expression is used. This needs to be replaced with NLP with LUIS integration 
  petHealthRequestRegex = /how is tom(.*)/i
  
  # The regular expression to check if latest pet image is being requested. Currently regular expression is used. This needs to be replaced with NLP with LUIS integration
  petlastImageRequestRegex = /show me tom(.*)/i
  
  
  # Respond to messages with details of Visual studio team services task
  if type is 'message' and text? and channel?
    
    messagePetHealthRequestMatch = petHealthRequestRegex.test(text)
    messagePetlastImageRequestMatch = petlastImageRequestRegex.test(text)
    
    # ***************Process "how is tom" request.
    if messagePetHealthRequestMatch is true
      console.log "how is tom mentioned in message"
       
       
       # currently stubbing, need to integrate with Machine Learning Service, and respond accordingly
      mlServiceResponse = true
      if mlServiceResponse is true
          channel.send ">>> *Tom is doing good mate*"
      
 
          
          
    # ***************Process "show me tom" request        
    else if messagePetlastImageRequestMatch is true
      console.log "show me tom found in message"
        
      blobSvc = azureStorage.createBlobService('iothackstoragegs','D1f2EzFW3OXkhsAcIKtL/qnNqnjigcmhq5dKxc/GW6vnqGba4N+Ws2Hywz+P6WZFIWULjhrzkzy6A6S5GLZd0Q==')
      blobSvc.listBlobsSegmented 'iothackstorageforimages', null, (error, result, response) ->
        if !error
            console.log result.entries
            lastElementIndex = parseInt(result.entries.length) - 1
            console.log lastElementIndex
            lastBlobName = result.entries[lastElementIndex].name
            channel.send "#{storageAccountBaseUrl}#{storageContainerName}/#{lastBlobName}"
        else
        return
        
  else
    #this one should probably be impossible, since we're in slack.on 'message' 
    typeError = if type isnt 'message' then "unexpected type #{type}." else null
    #Can happen on delete/edit/a few other events
    textError = if not text? then 'text was undefined.' else null
    #In theory some events could happen with no channel
    channelError = if not channel? then 'channel was undefined.' else null

    #Space delimited string of my errors
    errors = [typeError, textError, channelError].filter((element) -> element isnt null).join ' '

    console.log """
      @#{slack.self.name} could not respond. #{errors}
    """

slack.on 'error', (error) ->
  console.error "Error: #{error}"

slack.login()
