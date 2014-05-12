Strakker.ApplicationController = Ember.Controller.extend
    currentUser: (() ->
        return Strakker.AuthManager.get 'apiKey.user'
    ).property 'Strakker.AuthManager.apiKey'

    isAuthenticated: (() ->
        return Strakker.AuthManager.isAuthenticated()
    ).property 'Strakker.AuthManager.apiKey'
