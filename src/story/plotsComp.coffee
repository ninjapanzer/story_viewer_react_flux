define('PlotsComponent',[
  'React'
  'jQuery'
  '../svgDraw'
  '../storyDispatcher'
],
(
  React
  jQuery
  svgDraw
  dispatcher
)->
  PlotsComponent = React.createClass

    divStyle:
      display: 'inline'
      width: '10em'
      float: 'right'
      marginTop: '20em'
#      width: '40em'
#      margin: 'auto'
    title:
      fontWeight: 'bold'
      textAlign: 'right'
      width: '7em'
      display: 'inline-block'
      marginRight: '0.5em'

    getInitialState: ->
      return { plots: [] }

    connectAll: ->
      svgDraw.connectElements(jQuery("#svg1"), jQuery("#myNewPath"), jQuery("#Mary"),  jQuery("#Tom"))

    componentDidMount: ->
      dispatcher.register (payload)=>
        switch payload.actionType
          when "plots-changed"
            @setState({ plots: payload.plots.models })

    componentDidUpdate: (prevProps, prevState) ->
      if prevState.plots[0]?.get('story_id') != undefined && jQuery("#story-#{prevState.plots[0]?.get 'story_id'}").length
        console.log(jQuery("#story-#{prevState.plots[0]?.get 'story_id'}"))
        svgDraw.connectElements(jQuery("#svg1"), jQuery("#myNewPath"), jQuery("#story-#{prevState.plots[0].get 'story_id'}"),  jQuery("#plot-#{prevState.plots[0].get 'id'}"))
        svgDraw.connectElements(jQuery("#svg1"), jQuery("#myNewPath2"), jQuery("#story-#{prevState.plots[0].get 'story_id'}"),  jQuery("#plot-#{prevState.plots[1].get 'id'}"))


    render: ->
      <div>
        Plots
        { @state.plots?.map (item)=>
          <div id="plot-#{item.get? 'id'}" style={@divStyle}>
            <div>
              <span style={@title}>Title: </span><span>{item.get 'title'}</span>
            </div>
            <div>
              <span style={@title}>Description: </span><span>{item.get 'description'}</span>
            </div>
          </div>
        }
      </div>

  PlotsComponent
)