class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      render plain: Todo.order(:id).map { |todo| todo.to_pleasant_string }.join("\n")
    end
    def show
      id = params[:id]
      todo = Todo.find(id)
      puts todo
      render plain: todo.to_pleasant_string
    end
    def create
      todo_text = params[:todo_text]
      due_date = DateTime.parse(params[:due_date])
      completed = false
      new_todo = Todo.create!(
        todo_text: todo_text,
        due_date: due_date,
        completed: completed
      )
      response_text = "New todo created with id #{new_todo.id}"
      render plain: response_text
    end
    def update
      id = params[:id]
      completed = params[:completed]
      todo = Todo.find(id)
      todo.completed = completed
      todo.save!
      render plain: "Completed #{id} todo to #{completed}."
    end
  end