SplunkLogger = require '../splunk-logger.coffee'

describe 'SplunkLogger', ->
  beforeEach ->
    login =
      username: "admin"
      password: "admin"

  describe 'when logging into splunk check if it exists', ->
