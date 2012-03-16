TodoList.Views.Tasks ||= {}

class TodoList.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: () ->
    @options.tasks.bind('reset', @addAll)

  addAll: () =>
    if(@options.tasks.length == 0)
      $("#tasks-table").html("<p class=alt style='font-size:14px;'>You don't have any tasks in this task list!</p>")
    @options.tasks.each(@addOne)

  addOne: (task) =>
    view = new TodoList.Views.Tasks.TaskView({model : task})
    @$("#tasks-table").append(view.render().el)

  render: =>
    $(@el).html(@template(tasks: @options.tasks.toJSON() ))
    @addAll()

    return this
