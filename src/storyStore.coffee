define([
  './storyDispatcher'
  './storyItem'
  'Backbone'
],
(
  dispatcher
  Story
  backbone
)->
  ItemCollection = Backbone.Collection.extend
    url: '/stories'
    model: Story

    initialize: ->
      @dispatchToken = dispatcher.register((payload)=>
        @dispatchCallback(payload)
      )

    dispatchCallback: (payload)->
      switch payload.actionType
        when "add-story"
          @add {'story': payload}

  ItemCollection
)
