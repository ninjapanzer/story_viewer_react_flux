define([
  './storyDispatcher'
  './plotPointItem'
  'Backbone'
],
(
  dispatcher
  plotPoint
  backbone
)->
  ItemCollection = Backbone.Collection.extend
    url: ->
      "/story/#{@props.story}/plot_points/"

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
