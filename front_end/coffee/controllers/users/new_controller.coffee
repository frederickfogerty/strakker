Strakker.UsersNewController = Ember.ObjectController.extend
    createUser: () ->
        router = @get 'target'
        data = @getProperties 'name', 'email', 'username', 'password', 'password_confirmation'
        user = @get 'model'

        $.post '/users', {user: data}, (results) ->
            Strakker.AuthManager.authenticate results.api_key.access_token, results.api_key.user_id
            router.transitionTo 'index'