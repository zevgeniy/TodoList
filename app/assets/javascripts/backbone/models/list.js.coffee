class TodoList.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults:
    name: null
    description: null

class TodoList.Collections.ListsCollection extends Backbone.Collection
  model: TodoList.Models.List
  url: '/lists'
  project_id: null
