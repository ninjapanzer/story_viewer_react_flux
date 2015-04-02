define([
  'React'
  'jQuery'
  './storyDispatcher'
  './storyStore'
  './storyItem'
  './plotPointStore'
],
(
  React
  jQuery
  dispatcher
  stories
  story
  plotPointStore
)->
  $storyView = jQuery('#story-view')
  storyID = $storyView.data('story')
  storyView = new story(id: storyID).fetch()
)