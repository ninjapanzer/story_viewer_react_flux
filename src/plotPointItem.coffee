define([
  'Backbone'
  './config'
],
(
  backbone
  Config
)->
  PlotPoint = Backbone.Model.extend

    urlRoot: "#{Config.path}/plot_points"

    defaults:
      title: "title",
      desc:  "desc"

  PlotPoint
)
