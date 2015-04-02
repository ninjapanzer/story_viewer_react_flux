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
      @dispatchToken = dispatcher.register((payload)=>
        @dispatchCallback(payload)
      )

    dispatchCallback: (payload)->
      switch payload.actionType
        when "add-plotPoint"
          @add {'story': payload}

  ItemCollection
)
