define([
  'React'
  'jQuery'
  './storyDispatcher'
  './storyStore'
  './storyItem'
  './plotPointStore'
  './story/storyComp'
],
(
  React
  jQuery
  dispatcher
  stories
  story
  plotPointStore
  storyComp
)->
  $storyView = jQuery('#story-view')
  storyID = $storyView.data('story')
  storyView = new story(id: storyID)
  storyView.fetch()

  React.render(
    <storyComp />,
    document.getElementById('story-view')
  );
)