TodoList.Views.Lists ||= {}

class TodoList.Views.Lists.IndexView extends Backbone.View
  template: JST["backbone/templates/lists/index"]

  initialize: () ->
    @options.lists.bind('reset', @addAll)

  addAll: () =>
    @options.lists.each(@addOne)
    if(@options.lists.length == 0)
      $("#lists-table").html("<p class=alt style='font-size:14px;'>You don't have any task lists!</p>")

  addOne: (list) =>
    view = new TodoList.Views.Lists.ListView({model : list})
    @$("#lists-table").append(view.render().el)

  render: =>
    $(@el).html(@template(lists: @options.lists.toJSON() ))
    @addAll()
    return this
