class Todo < ActiveRecord::Base
    def due_today?
        due_date == Date.today
    end
    
    def self.overdue
        where("due_date < ?", Date.today)
    end

    def self.due_today
        where("due_date = ?", Date.today)
    end

    def self.due_later
        where("due_date > ?", Date.today)
    end

    def self.add_task(todo)
        Todo.create!(todo_text:todo[:todo_text],due_date: (Date.today + todo[:due_in_days]), completed:false)
    end
  
    def self.mark_as_complete(todo_id)
        todo = Todo.find(todo_id)
        todo.completed = true
        todo.save
        todo
    end
end