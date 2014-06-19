Strakker.Router.map () ->
    @resource 'auth', () ->
        @route 'login'
        @route 'recover'
    @route 'dashboard', {path: "/"}

Strakker.ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin
