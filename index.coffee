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
    throw new Error('Could not connect to Meshblu')
  else
    meshbluClient.subscribe config.uuid
    debug "I'm uuid:", config.uuid
    console.log 'Connected to Meshblu...'

meshbluClient.on 'message', (message) =>
  debug 'message received', message
  splunkLogger.log message, (error, result) ->
    if error
      return new Error()
    debug 'result', result

meshbluClient.on 'error', =>
  throw new Error('Could not connect to Meshblu')
