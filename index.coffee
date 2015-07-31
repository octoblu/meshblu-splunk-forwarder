config = require './meshblu.json'
splunkConfig = require './.splunkrc.json'
Meshblu = require 'meshblu-websocket'
SplunkLogger = require './splunk-logger'

meshbluClient = new Meshblu(config)
splunkLogger = new SplunkLogger(splunkConfig)

splunkLogger.login (error, success) ->
  splunkConnected = if splunkConnected? then false

meshbluClient.connect (error, meshbluConnection) =>
  console.log 'connected to meshblu!'

     #retry connection or disconnect from meshblu
  meshbluClient.on 'message', (message) =>
     if splunkConnected
       splunkLogger.log message, (error, result) ->
