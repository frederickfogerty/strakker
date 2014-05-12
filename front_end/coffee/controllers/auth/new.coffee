Strakker.AuthNewController = Ember.ObjectController.extend
    loginUser: () ->
        router = @get 'target'
        data = @getProperties 'username_or_email', 'password'

        $.post('/api/auth', data, (results) -> 
            Strakker.AuthManager.authenticate results.api_key.access_token, results.api_key.user_id
            router.transitionTo 'index'
            )