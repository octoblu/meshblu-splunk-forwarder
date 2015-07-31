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
    debug 'connected to meshblu!'
    debug 'meshbluClient', this

meshbluClient.ws.on 'message', (frame) =>
  debug 'message received', frame
