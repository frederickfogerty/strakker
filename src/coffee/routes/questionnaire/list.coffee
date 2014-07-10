Strakker.QuestionnaireListRoute = Ember.Route.extend
    model: () ->
        return @store.find('questionnaire')
    actions: 
        newQuestionnaire: ->
            questionnaire = @store.createRecord('questionnaire', {name: "Somethin"})
            @transitionTo 'questionnaire.edit', questionnaire