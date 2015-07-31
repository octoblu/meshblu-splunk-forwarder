config = require './meshblu.json'
splunkConfig = require './.splunkrc.json'
Meshblu = require 'meshblu-websocket'
SplunkLogger = require './splunk-logger'
debug = require('debug')('splunk-logger')

meshbluClient = new Meshblu(config)
splunkLogger = new SplunkLogger(splunkConfig)

splunkLogger.login (error, success) ->
  splunkConnected = if splunkConnected? then false

meshbluClient.connect (error) =>
  if error
    debug 'Could not connect to meshblu!'
  else
    console.log "I'm using uuid:", config.uuid
    meshbluClient.subscribe config.uuid
    debug 'connected to meshblu!'
    debug 'meshbluClient', @

meshbluClient.on 'message', (frame) =>
  console.log 'message received', frame
  splunkLogger.log frame, (err, result) ->
    if err
      console.error err
    console.log 'looks good', result
