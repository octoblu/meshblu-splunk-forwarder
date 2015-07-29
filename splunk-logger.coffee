
class SplunkLogger
  constructor: (options={},  dependencies={} ) ->

    @splunkService = dependencies.splunkService #or create a new one
    @splunkService.login()

module.exports = SplunkLogger
