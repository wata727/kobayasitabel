$ ->
  Search = React.createClass
    getInitialState: ->
      can_eat: ''

    search: (e) ->
      e.preventDefault();
#      $.post this.props.source, ((result) ->
#        this.setState {
#          can_eat: result[0].can_eat
#        }
#        return
#      ).bind this
#      return
      $.post this.props.source, { search: React.findDOMNode(this.refs.search).value.trim() }, ((result) ->
        if result.can_eat
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
        <p>{this.state.message}</p>
        <form onSubmit={this.search} action="/search.json" accept-charset="UTF-8" method="post">
          <input name="utf8" type="hidden" value="&#x2713;" />
          <input type="hidden" name="authenticity_token" value="MOh9S1B6Igal93QUTxaeO6kYpNDumrwJzHaChwgxl7DxHEibeMZUkBXkV6g/IfzabBkyYJA+BUXilEq3uinUqQ==" />
          <div class="form-group">
            <input type="text" name="search" id="search" class="form-control" ref="search" />
          </div>
          <input type="submit" value="食べれる？" class="btn btn-primary btn-lg" />
        </form>
      </div>`

  React.render `<Search source="/search.json" />`, search
