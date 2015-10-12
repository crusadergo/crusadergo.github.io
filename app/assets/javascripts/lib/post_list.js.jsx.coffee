modulejs.define 'lib/post_list', ->

  React.createClass

    render: ->
      postNodes = @props.data.map (post) ->
        `<div className='post'>
            <div className='post-title'><h1>{post.title}</h1></div>
            <div className='post-author'><h2>{post.author}</h2></div>
            <div className='post-date'>{post.created_at}</div>
            <div className='post-text'>{post.text}</div>
        </div>`

      `<div className="postList">
        {postNodes}
      </div>`
