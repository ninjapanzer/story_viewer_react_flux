define([
  'Backbone'
  './config'
],
(
  backbone
  Config
)->
  PlotPoint = Backbone.Model.extend
    url: ->
      "#{Config.path}/plot_point/#{@id}"
    defaults:
      id: -1

  PlotPoint
)
