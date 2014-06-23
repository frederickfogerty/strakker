Strakker.QuestionnaireListRoute = Ember.Route.extend
    model: () ->
        return @store.find('questionnaire')