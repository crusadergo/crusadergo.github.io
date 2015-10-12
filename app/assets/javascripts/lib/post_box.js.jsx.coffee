#= require lib/post_list
#= require lib/post_form

modulejs.define 'lib/post_box', ['lib/post_list', 'lib/post_form'], (PostList, PostForm) ->

  React.createClass

    loadPostsFromServer: ->
      $.ajax
        url: @props.url
        dataType: 'json'
        cache: false
        success: (data) =>
          @setState {data: data}

        error: (xhr, status, err) =>
          console.error @props.url, status, err.toString()

    handlePostSubmit: (post) ->
      posts = @state.data
      newPosts = posts.concat [post]
      @setState {data: newPosts}

      $.ajax
        url: @props.url
        dataType: 'json'
        type: 'POST'
        data: post
        beforeSend: (xhr) ->
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (data) =>
          @setState {data: data}
        error: (xhr, status, err) =>
          console.error @props.url, status, err.toString()

    getInitialState: ->
      return data: []

    componentDidMount: ->
      @loadPostsFromServer()
      setInterval @loadPostsFromServer, @props.pollInterval

    render: ->
      `<div className="postBox">
          <PostForm onPostSubmit={this.handlePostSubmit} />
          <h1>Posts</h1>
          <PostList data={this.state.data} />
      </div>`
