Strakker.Router.map () ->
    @route 'login'
    @route 'protected'

Strakker.ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin
