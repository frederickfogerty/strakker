Strakker.AuthRecoverController = Ember.Controller.extend
    actions:
        recover: () ->
            email = @get 'email'
            @set 'status', 'Loading...'
            @set 'email', ''
            $.ajax('/api/auth/recover',
                context: this,
                data: 
                    email: email
                ).done () ->
                    @set 'status', 'Email sent to ' + email
                .fail () ->
                    @set 'status', 'Get me a real error.'
    

