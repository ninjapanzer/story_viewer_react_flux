define([
  'Backbone'
  './plotPointStore'
],
(
  backbone
  plotPointStore
)->
  Story = Backbone.Model.extend
    url: ->
      "story/#{@get('id')}"

    defaults:
      id: -1
      plotPoints: []

    initialize: ->
      @plotPoints = new plotPointStore(story: @id).fetch()

  Story
)
