ListModel = require './list-model'
Branch = require './branch'
_ = require 'underscore'

module.exports =
class BranchList extends ListModel
  model: Branch

  refresh: (heads) ->
    @reset()
    _.each heads, (branch) =>
      @add branch
      #b.fetch()

    @trigger "refresh"
    @select @selected

  checkout_branch: (callback)->
    repo = @selection().get "repo"
    branch = @selection().name()
    repo.git "checkout #{branch}", (e, f, s) =>
      console.log e, f, s if e
      callback()

  local: ->
    @models

  remote: ->
    []