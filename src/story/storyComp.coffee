define('StoryComponent',[
  'React'
  '../storyDispatcher'
  './plotsComp'
  './plotControlsComp'
],
(
  React
  dispatcher
  plotsComp
  plotControlsComp
)->
  StoryComponent = React.createClass

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
      return { story: [] }

    componentDidMount: ->
      dispatcher.register (payload)=>
        switch payload.actionType
          when "story-changed"
            @setState({ story: payload.story })

    render: ->
      <div style={@divStyle}>
        <div>
          <span style={@title}>Title: </span><span>{@state.story.get? 'title'}</span>
        </div>
        <div>
          <span style={@title}>Description: </span><span>{@state.story.get? 'description'}</span>
        </div>
        <plotsComp/>
        <plotControlsComp story={ @state.story }/>
      </div>

  StoryComponent
)