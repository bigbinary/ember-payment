Payment.Router = Ember.Router.extend

  location: "hash"

  root: Ember.Route.extend

    index: Ember.Route.extend
      route: "/"
      aboutEvent: Ember.Route.transitionTo('about')
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet "creditcard", Payment.Creditcard.create()

    about: Ember.Route.extend
      route: "/about"
      showUser: Ember.Route.transitionTo('showuser')
      connectOutlets: (router) ->
        a = []
        a.push(Payment.User.create({ "name": "neeraj", "githubid": "neerajdotname" }))
        router.get('applicationController').connectOutlet('about', a)

    showuser: Ember.Route.extend
      route: "/:name"
      deserialize: (router, params) ->
        Payment.User.create({ "name": params.name, "githubid": "neerajdotname" } )
      connectOutlets: (router, user) ->
        router.get('applicationController').connectOutlet('user', user)

