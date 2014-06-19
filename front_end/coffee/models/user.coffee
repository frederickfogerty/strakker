Strakker.User = DS.Model.extend
    email: DS.attr('string')
    name: DS.attr('string')
    subscription_type: DS.attr('string')
    subscription_expiry: DS.attr('string')
    questionnaires: DS.hasMany('questionnaire')

Strakker.User.FIXTURES = [
    {id: 1337, name: 'Frederick Fogerty', email: 'freelyfred@gmail.com', subscription_type: 'Baller'}
]
