modulejs.define 'lib/post', ->

  React.createClass

    rawMarkup: ->
      rawMarkup = marked(@props.children.toString(), {sanitize: true})
      return __html: rawMarkup

    render: ->
      `<div className="post">
        <h2 className="postAuthor">
          {this.props.author}
        </h2>
        <span dangerouslySetInnerHTML={this.rawMarkup()} />
      </div>`
