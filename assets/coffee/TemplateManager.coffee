GW.TemplateManager =
  templates: {},
  get: (id, callback) ->
    # Can we find this template in the cache?
    if (@templates[id])
      # Yes? OK, lets call our callback function and return.
      callback(@templates[id])

    # Otherwise, lets load it up. We'll build our URL based on the ID passed in.
    url = "/tpl/#{ id }.html"

    # And use a handy jQuery library called Traffic Cop to handle marshalling
    # requests to the server. This will prevent multiple concurrent requests
    # for the same resource.
    promise = $.trafficCop(url)

    # Wire up a handler for this request via jQuery's promise API
    promise.done (template) =>
      # `template` is a string of HTML loaded via `$.ajax`. So here, we
      # can take the opportunity to pre-compile it for performance. When we
      # pre-compile a template, it returns a function that we can store in our
      # cache for future use.
      tmp = Handlebars.compile(template)
      @templates[id] = tmp
      callback tmp