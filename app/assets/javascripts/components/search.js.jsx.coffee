$ ->
  Search = React.createClass
    getInitialState: ->
      can_eat: ''

    search: (e) ->
      e.preventDefault();
      $.post this.props.source, { search: React.findDOMNode(this.refs.search).value.trim() }, ((result) ->
        if result == null
          this.setState {
            message: "食べられるかわかりません"
          }
          return
        else if result.can_eat
          this.setState {
            message: "食べられるそうです"
          }
          return
        else
          this.setState {
            message: "食べられないそうです"
          }
          return
      ).bind this
      return

    render: ->
      `<div className="Search">
        <div className="result">{this.state.message}</div>
        <form onSubmit={this.search} action="/search.json" accept-charset="UTF-8" method="post">
          <input name="utf8" type="hidden" value="&#x2713;" />
          <input type="hidden" name="authenticity_token" value="MOh9S1B6Igal93QUTxaeO6kYpNDumrwJzHaChwgxl7DxHEibeMZUkBXkV6g/IfzabBkyYJA+BUXilEq3uinUqQ==" />
          <div className="form-group">
            <input type="text" name="search" id="search" className="form-control" ref="search" />
          </div>
          <input type="submit" value="食べれる？" className="btn btn-primary btn-lg" />
        </form>
      </div>`

  React.render `<Search source="/search.json" />`, search
