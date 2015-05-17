define('PlotsComponent',[
  'React'
  '../storyDispatcher'
],
(
  React
  dispatcher
)->
  PlotsComponent = React.createClass

    divStyle:
      backgroundColor: '#ECEAEA'
      width: '40em'
      margin: 'auto'
      padding: '1em'
    title:
      fontWeight: 'bold'
      textAlign: 'right'
      width: '7em'
      display: 'inline-block'
      marginRight: '0.5em'

    getInitialState: ->
      return { plots: [] }

    componentDidMount: ->
      dispatcher.register (payload)=>
        switch payload.actionType
          when "plots-changed"
            @setState({ plots: payload.plots.models })
    render: ->
      <div style={@divStyle}>
        Plots
        { @state.plots?.map (item)->
          <div>
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