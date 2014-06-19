Strakker.AccountRoute = Ember.Route.extend
    model: () ->
        return @store.find('user', 1337)