Collection = require './collection'

class TaskFiles extends Collection

    url: =>
        fullPath = "#{ @directory }/#{ @path ? ''}"
        "http://#{ @offerHostname }:#{ constants.mesosLogsPort }/files/browse.json?path=#{ escape fullPath }&jsonp=?"

    initialize: (models, { @taskId, @offerHostname, @directory, @path }) =>

    parse: (taskFiles) =>
        _.map taskFiles, (taskLogFile) =>
            taskLogFile.shortPath = taskLogFile.path.split(/\//).reverse()[0]
            taskLogFile.mtimeHuman = moment(taskLogFile.mtime * 1000).from()
            taskLogFile.sizeHuman = Humanize.fileSize(taskLogFile.size)
            taskLogFile.downloadLink = "http://#{ @offerHostname }:#{ constants.mesosLogsPort }/files/download.json?path=#{ taskLogFile.path }"
            taskLogFile.isDirectory = taskLogFile.mode[0] is 'd'
            taskLogFile.relPath = taskLogFile.path.replace(@directory, '')
            taskLogFile.taskId = @taskId
            taskLogFile

    comparator: (a, b) ->
        if a.get('isDirectory') and not b.get('isDirectory')
            return 1
        else if not a.get('isDirectory') and b.get('isDirectory')
            return -1
        return a.get('size') - b.get('size')

module.exports = TaskFiles