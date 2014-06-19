Strakker.DashboardRoute = Ember.Route.extend
    model: () ->
        return @store.find('questionnaire')
