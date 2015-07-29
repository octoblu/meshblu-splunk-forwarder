SplunkLogger = require '../splunk-logger.coffee'

describe 'SplunkLogger', ->
  beforeEach ->

    @options = {
      username: ''
      password: 'password'
      scheme: 'scheme'
      host: 'host'
      port: 'port'
      version: 'version'
    }

    @dependencies =
      splunkService :
        login : sinon.spy()

    @sut = new SplunkLogger @options, @dependencies

  it 'should exist', ->
    expect(@sut).to.exist


  it 'should call the splunkService.login in the constructor', ->
    expect(@dependencies.splunkService.login).to.have.been.called
