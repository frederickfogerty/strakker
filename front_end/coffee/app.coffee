window.Strakker = Ember.Application.create()
Strakker.Store = DS.Store.extend();
Strakker.inject('component', 'store', 'store:main');

