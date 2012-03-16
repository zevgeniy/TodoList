class TodoList.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults:
    name: null
    description: null
    state: null
    priority: null

class TodoList.Collections.TasksCollection extends Backbone.Collection
  model: TodoList.Models.Task
  url: '/tasks'
  list_id: null
  project_id: null