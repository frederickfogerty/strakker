Strakker.Router.map () ->
    @resource 'auth', () ->
        @route 'new'
    @resource 'users', () ->
        @route 'new'

Strakker.ApplicationRoute = Ember.Route.extend
    init: () ->
        @_super()
        Strakker.AuthManager = AuthManager.create()

    actions: 
        logout: () ->
            Strakker.AuthManager.reset()
            this.transitionTo 'index'
