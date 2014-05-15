Strakker.AuthLoginController = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin, {
    authenticatorFactory: 'authenticator:oauth2-password-grant'
}