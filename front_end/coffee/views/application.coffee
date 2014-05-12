Strakker.ApplicationView = Ember.View.extend
    templateName: 'application'
    didInsertElement: () ->
        if $('.ui-page-active').length then $('.ui-page-active').parent().trigger('create')