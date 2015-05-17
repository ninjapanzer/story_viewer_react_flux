define([
  'Backbone'
  './storyDispatcher'
  './plotPointStore'
  './config'
],
(
  backbone
  dispatcher
  plotPointStore
  Config
)->
  Story = Backbone.Model.extend
    url: ->
      "#{Config.path}/story/#{@get('id')}"

    defaults:
      id: -1
      plotPoints: []

    initialize: ->
      plotPoints = new plotPointStore(story: @id)
      plotPoints.fetch()
      @set 'plotPoints', plotPoints
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "story-changed"
          story: @

  Story
)
