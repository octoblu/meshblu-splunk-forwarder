SplunkLogger = require '../splunk-logger.coffee'

describe 'SplunkLogger', ->
  beforeEach ->

    options =
      splunkOptions
        username: username,
        password: password,
        scheme: scheme,
        host: host,
        port: port,
        version: version

    @sut = new SplunkLogger options

  describe 'it exists', ->
    @login

  describe "when given splunk credentials, it calls the service's login", ->
