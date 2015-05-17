define('plotControlsComponent',[
  'React'
  '../storyDispatcher'
  '../plotPointStore'
  '../plotPointItem'
  '../config'
],
(
  React
  dispatcher
  plotPointStore
  plotPointItem
  Config
)->
  plotControlsComponent = React.createClass

    getInitialState: ->
      return {}

    componentDidMount: ->

    handleAddClick: ->
      item = new plotPointItem()
      item.set 'story_id', @props.story.id
      item.set 'title', @refs.title.getDOMNode().value
      item.set 'description', @refs.description.getDOMNode().value
      item.save()

    render: ->
      <div>
        <form onSubmit={@handleAddClick}>
          <label for='plotTitle'>Title</label>
          <input ref='title' type='text' placeholder='title'/>
          <label for='plotDesc'>Description</label>
          <input ref='description' type='text' placeholder='description'/>
          <input type='submit'  value='Add'/>
        </form>
      </div>

  plotControlsComponent
)
