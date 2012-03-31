class TodoList.Routers.ListsRouter extends Backbone.Router
  initialize: (options) ->
    @lists = new TodoList.Collections.ListsCollection()
    @lists.reset options.lists

  routes:
    "/lists/new"      : "newList"
    "/lists/index"    : "index"
    "/lists/:id/edit" : "edit"
    "/lists/:id"      : "show"

  newList: ->
    @view = new TodoList.Views.Lists.NewView(collection: @lists)
    $("#add-list").hide()
    $("#add-list").html(@view.render().el)
    $("#add-list").show(500)
    
  index: ->
    @view = new TodoList.Views.Lists.IndexView(lists: @lists)
    $("#tasksList").html(@view.render().el)

  show: (id) ->
    project = @projects.get(id)
    @tasks.url = '/projects/' + @lists.project_id + '/lists/' + id
    @tasks.fetch()
    @tasks.list_id = id
    @tasks.url = '/projects/' + @lists.project_id + '/lists/' + id + '/tasks'
    @view = new TodoList.Views.Tasks.IndexView(tasks: @tasks)
    $("#tasks").html(@view.render().el)

  edit: (id) ->
    list = @lists.get(id)

    @view = new TodoList.Views.Lists.EditView(model: list)
    $("#task-list"+id).html(@view.render().el)  
