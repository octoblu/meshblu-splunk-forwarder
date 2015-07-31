config = require './meshblu.json'
splunkConfig = require './'
Meshblu = require 'meshblu-websocket'
Splunk = require './splunk-logger'

meshbluClient = new Meshblu(config)
splunkLogger = new Splunk(splunkConfig)

console.log('splunkConfig', splunkConfig)

meshbluClient.register()
meshbluClient.on 'message', (message) =>
  #Send this data to Splunk
  #need splunk-logger.coffee - connects to splunk
  # takes options (creds, etc)
