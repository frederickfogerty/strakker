Strakker.Questionnaire = DS.Model.extend
    status: DS.attr()
    name: DS.attr('string')
    email_template: DS.attr()
    created: DS.attr('date')

Strakker.Questionnaire.FIXTURES = [
    {id: 1, status: 'something', name: 'Questionnaire 1', email_template: 'hihihih', created: new Date()},
    {id: 2, status: 'something', name: 'Questionnaire 2', email_template: 'hihihih', created: new Date()},
    {id: 3, status: 'something', name: 'Questionnaire 3', email_template: 'hihihih', created: new Date()},
    {id: 4, status: 'something', name: 'Questionnaire 4', email_template: 'hihihih', created: new Date()},
    {id: 5, status: 'something', name: 'Questionnaire 5', email_template: 'hihihih', created: new Date()}
]
