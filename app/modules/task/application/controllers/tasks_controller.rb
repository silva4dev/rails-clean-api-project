require_relative "../commands/create_task_command"
require_relative "../commands/create_sub_task_command"
require_relative "../../infra/queries/tasks_query"
require_relative "../../../shared/controllers/application_controller"
require_relative "../usecases/task_use_case"

module Task
  module Application
    module Controllers
      class TasksController < Shared::Controllers::ApplicationController
        # Command
        def create_task
          command = Task::Application::Commands::CreateTaskCommand.new(
            user_id: params[:user_id],
            name: params[:name],
            status: params[:status],
          )
          task_id = Task::Application::Usecases::TaskUseCase.new.create_task(command)

          head :created, location: "tasks/#{task_id}"
        end

        def create_sub_task
          command = Task::Application::Commands::CreateSubTaskCommand.new(
            task_id: params[:task_id],
            name: params[:name],
            status: params[:status],
          )
          sub_task_id = Task::Application::Usecases::TaskUseCase.new.create_sub_task(command)

          head :created, location: "sub_tasks/#{sub_task_id}"
        end

        # Query
        def find_all_tasks
          tasks = Task::Application::Usecases::TaskUseCase.new.find_all_tasks
          render json: tasks, status: :ok
        end
      end
    end
  end
end
