Strakker.AuthLoginController = Ember.Controller.extend Ember.SimpleAuth.AuthenticationControllerMixin, {
    loginFailed: false
    isProcessing: false

    authenticatorFactory: 'ember-simple-auth-authenticator:oauth2-password-grant'
    
    actions: 
        authenticate: () ->
            @setProperties
                loginFailed: false
                isProcessing: true
            data = @getProperties 'identification', 'password'
            @set 'password', null
            @_super(data).then(
                () =>
                    @set 'isProcessing', false
                , () =>
                    @.setProperties
                        loginFailed: true
                        isProcessing: false
                )
        
    
}