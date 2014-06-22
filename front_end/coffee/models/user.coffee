Strakker.User = DS.Model.extend
    email: DS.attr('string')
    name: DS.attr('string')
    subscription_type: DS.attr('string')
    subscription_expiry: DS.attr('string')
    formatted_subscription_expiry: (->
        return moment(@get('subscription_expiry')).fromNow() + " (" + moment(@get('subscription_expiry')).format('MMMM Do YYYY') + ")"
    ).property('subscription_expiry')
    questionnaires: DS.hasMany('questionnaire')
    gravatar_hash: (->
        return 'http:\/\/gravatar.com\/avatar\/' + md5(@get('email').trim()) + '?s=250&d=mm'
    ).property('email')

Strakker.User.FIXTURES = [
    {id: 1337, name: 'Frederick Fogerty', email: 'freelyfred@gmail.com', subscription_type: 'Baller', subscription_expiry: moment('6 November 2014').toISOString()}
]
