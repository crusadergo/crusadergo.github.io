modulejs.define 'lib/post_form', ->

  React.createClass

    handleSubmit: (e) ->
      e.preventDefault()
      author = @refs.author.value.trim()
      title = @refs.title.value.trim()
      text = @refs.text.value.trim()

      return unless text && author && title

      @props.onPostSubmit({author: author, text: text, title: title})
      @refs.author.value = ''
      @refs.title.value = ''
      @refs.text.value = ''

      return


    render: ->
      `<form className="postForm" onSubmit={this.handleSubmit}>
        <input className='author-input' type="text" placeholder="Your name" ref="author" />
        <input className='title-input' type="text" placeholder="Your title" ref="title" />
        <textarea className="text-input" placeholder="Say something..." ref="text" />
        <input className='button' type="submit" value="Post" />
      </form>`
