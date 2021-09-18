class TodosController < ApplicationController
  def index
    #@todos = Todo.of_user(current_user)
    @todos = current_user.todos
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    completed = false
    new_todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: completed,
      user_id: current_user.id,
    )
    if !new_todo.save
      flash[:error] = new_todo.errors.full_messages.join(", ")
    end
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
