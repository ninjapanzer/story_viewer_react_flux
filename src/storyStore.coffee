define([
  './storyDispatcher'
  './storyItem'
  'Backbone'
  './config'
],
(
  dispatcher
  Story
  backbone
  Config
)->
  ItemCollection = Backbone.Collection.extend
    url: '#{Config.path}/stories'
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
