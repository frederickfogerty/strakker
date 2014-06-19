Ember.Application.initializer
    name: 'authentication'
    initialize: (container, application) ->
        Ember.SimpleAuth.setup(container, application)

window.Strakker = Ember.Application.create()

# Strakker.ApplicationAdapter = DS.LSAdapter.extend()
Strakker.ApplicationAdapter = DS.FixtureAdapter
# Strakker.Store = DS.Store.extend();
Strakker.inject('component', 'store', 'store:main')

$ () ->
    $(document).foundation()