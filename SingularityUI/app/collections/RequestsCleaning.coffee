Collection = require './collection'

Requests = require './Requests'

class RequestsCleaning extends Requests

    url: "#{ env.SINGULARITY_BASE }/#{ constants.api_base }/requests/queued/cleanup"

    parse: (requests) ->
        _.each requests, (requestIdString) =>
            request = {}
            request.id = requestIdString
            requests[i] = request

        requests

module.exports = RequestsCleaning