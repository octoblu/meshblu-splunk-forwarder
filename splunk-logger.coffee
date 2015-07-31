splunkjs = require 'splunk-sdk'
debug = require('debug') ('splunk-logger')

class SplunkLogger
  constructor:(options={}, dependencies={}) ->
    @splunkOptions = options
    @splunkService = dependencies.splunkService || new splunkjs.Service(@splunkOptions)

  login:(callback=->) =>
    # test to be called
    @splunkService.login(callback)

  log:(message, callback) =>
    # test splunkOp
    @splunkService.log(message, @splunkOptions, callback)

module.exports = SplunkLogger
