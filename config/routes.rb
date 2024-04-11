Rails.application.routes.draw do
  scope module: :task do
    scope module: :application do
      scope module: :controllers do
        # Commands
        post "tasks", to: "tasks#create_task"
        post "sub_tasks", to: "tasks#create_sub_task"

        # Queries
        get "tasks", to: "tasks#find_all_tasks"
      end
    end
  end
end
