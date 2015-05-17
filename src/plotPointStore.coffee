define([
  './storyDispatcher'
  './plotPointItem'
  'Backbone'
  './config'
],
(
  dispatcher
  plotPoint
  backbone
  Config
)->
  ItemCollection = Backbone.Collection.extend
    url: ->
      "#{Config.path}/story/#{@props.story}/plot_points/"

    defaults:
      story: -1

    model: plotPoint

    initialize: (props)->
      @props = props
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "plots-changed"
          plots: @

  ItemCollection
)
