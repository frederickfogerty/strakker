Strakker.Router.map () ->
    @resource 'auth', () ->
        @route 'login'
        @route 'recover'
    @resource 'questionnaire', () ->
        @route 'list'
        @route 'new'
        @route 'edit', {path: 'edit/:questionnaire_id'}
    @route 'account'
    @route 'dashboard', {path: "/"}

Strakker.ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin
