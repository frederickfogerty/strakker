window.AuthManager = Ember.Object.extend(
    
    # Load the current user if the cookies exist and is valid
    init: ->
        @_super()
        accessToken = $.cookie("access_token")
        authUserId = $.cookie("auth_user")
        @authenticate accessToken, authUserId  if not Ember.isEmpty(accessToken) and not Ember.isEmpty(authUserId)

    
    # Determine if the user is currently authenticated.
    isAuthenticated: ->
        not Ember.isEmpty(@get("apiKey.accessToken")) and not Ember.isEmpty(@get("apiKey.user"))

    
    # Authenticate the user. Once they are authenticated, set the access token to be submitted with all
    # future AJAX requests to the server.
    authenticate: (accessToken, userId) ->
        $.ajaxSetup headers:
            Authorization: "Bearer " + accessToken
        console.log this
        user = Strakker.User.store.find('user', userId)
        @set "apiKey", Strakker.ApiKey.create(
            accessToken: accessToken
            user: user
        )

    
    # Log out the user
    reset: ->
        Strakker.__container__.lookup("route:application").transitionTo "sessions.new"
        Ember.run.sync()
        Ember.run.next this, ->
            @set "apiKey", null
            $.ajaxSetup headers:
                Authorization: "Bearer none"

    
    # Ensure that when the apiKey changes, we store the data in cookies in order for us to load
    # the user when the browser is refreshed.
    apiKeyObserver: (->
        if Ember.isEmpty(@get("apiKey"))
            $.removeCookie "access_token"
            $.removeCookie "auth_user"
        else
            $.cookie "access_token", @get("apiKey.accessToken")
            $.cookie "auth_user", @get("apiKey.user.id")
    ).observes("apiKey")
)

# Reset the authentication if any ember data request returns a 401 unauthorized error
DS.rejectionHandler = (reason) ->
    Strakker.AuthManager.reset()  if reason.status is 401
    throw reason