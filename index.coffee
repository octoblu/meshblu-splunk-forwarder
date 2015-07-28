config = require './meshblu.json'
Meshblu = require 'meshblu-websocket'

meshbluClient = new Meshblu(config)

meshbluClient.register()
meshbluClient.on 'message', (message) =>
  #Send this data to Splunk
  #need splunk-logger.coffee - connects to splunk
  # takes options (creds, etc)
