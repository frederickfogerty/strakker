Ember.Application.initializer
    name: 'authentication'
    initialize: (container, application) ->
        Ember.SimpleAuth.setup(container, application)

window.Strakker = Ember.Application.create()

# Strakker.Router.reopen
#     location: 'history'

# Strakker.ApplicationAdapter = DS.LSAdapter.extend()
Strakker.ApplicationAdapter = DS.FixtureAdapter
# Strakker.Store = DS.Store.extend();
Strakker.inject('component', 'store', 'store:main')

$ ->
    $(document).foundation()

Strakker.Scrolling = Ember.Mixin.create(
    bindScrolling: (opts) ->
        onScroll = undefined
        opts = opts or debounce: 100
        if opts.debounce
            onScroll = App.debounce(=>
                this.scrolled()
            , 100)
        else
            onScroll = =>
                this.scrolled()
        $(document).bind "touchmove", onScroll
        $(window).bind "scroll", onScroll
        return

    unbindScrolling: ->
        $(window).unbind "scroll"
        $(document).unbind "touchmove"
        return
)