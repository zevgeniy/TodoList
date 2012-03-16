TodoList.Views.Lists ||= {}

class TodoList.Views.Lists.EditView extends Backbone.View
  template : JST["backbone/templates/lists/edit"]

  events :
    "submit #edit-list" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (list) =>
        @model = list
        window.location.hash = "/lists/index"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
