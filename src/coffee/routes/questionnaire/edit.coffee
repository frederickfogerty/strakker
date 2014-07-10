Strakker.QuestionnaireEditRoute = Ember.Route.extend
    model: (params) ->
        return @store.find('questionnaire', params.questionnaire_id)

