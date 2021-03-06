RootView = require 'views/core/RootView'
template = require 'templates/community-view'

module.exports = class CommunityView extends RootView
  id: 'community-view'
  template: template

  afterRender: ->
    super()
    @$el.find('.contribute-classes a').each ->
      characterClass = $(@).attr('href').split('#')[1]
      title = $.i18n.t("classes.#{characterClass}_title")
      titleDescription = $.i18n.t("classes.#{characterClass}_title_description")
      summary = $.i18n.t("classes.#{characterClass}_summary")
      explanation = "<h4>#{title} #{titleDescription}</h4>#{summary}"
      $(@).find('img').popover(placement: 'bottom', trigger: 'hover', container: 'body', content: explanation, html: true)

    @$el.find('.logo-row img').each ->
      $(@).popover(placement: 'bottom', trigger: 'hover', container: 'body')
