config = require './meshblu.json'
Meshblu = require 'meshblu-websocket'

meshbluClient = new Meshblu(config)

meshbluClient.register()
meshbluClient.on 'message', (message) =>
  #Send this data to Splunk
