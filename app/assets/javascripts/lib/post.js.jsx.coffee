modulejs.define 'lib/post', ->

  React.createClass

    render: ->
      `<div className="post">
        <h2 className="postAuthor">
          {this.props.author}
        </h2>
      </div>`
