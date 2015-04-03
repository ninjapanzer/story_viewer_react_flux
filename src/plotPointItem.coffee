define([
  'Backbone'
],
(
  backbone
)->
  PlotPoint = Backbone.Model.extend
    url: ->
      "/plot_point/#{@id}"
    defaults:
      id: -1

  PlotPoint
)
