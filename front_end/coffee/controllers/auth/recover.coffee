Strakker.AuthRecoverController = Ember.Controller.extend
    actions:
        recover: () ->
            email = @get 'email'
            console.log email
            @set 'alert', {}
            @set 'email', ''
            $.ajax('/api/auth/recover',
                context: this,
                data: 
                    email: email
                ).done () ->
                    @set 'alert.message', 'Email sent to #{email}. Redirecting in 3s...'
                    @set 'alert.type', 'success'
                    setTimeout( () =>
                        that.transitionToRoute('auth.login')
                    , 3000)
                .fail () ->
                    @set 'alert.message', 'Get me a real error.'
                    @set 'alert.type', 'alert'