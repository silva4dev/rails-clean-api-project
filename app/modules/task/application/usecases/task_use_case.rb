require_relative "../../infra/repositories/task_repository"
require_relative "../../infra/queries/tasks_query"
require_relative "../../domain/task"

module Task
  module Application
    module Usecases
      class TaskUseCase
        def initialize(repositories = {})
          @task_repository = repositories.fetch(:task) { Task::Infra::Repositories::TaskRepository.new }
        end

        # Command
        def create_task(create_task_command)
          task = Task::Domain::Task.new(
            user_id: create_task_command.user_id,
            name: create_task_command.name,
            status: create_task_command.status,
          )

          ActiveRecord::Base.transaction do
            @task_repository.save(task)
            task.id
          end
        end

        def create_sub_task(create_sub_task_command)
          sub_task = Task::Domain::SubTask.new(
            task_id: create_sub_task_command.task_id,
            name: create_sub_task_command.name,
            status: create_sub_task_command.status,
          )

          ActiveRecord::Base.transaction do
            @task_repository.save(sub_task)
            sub_task.id
          end
        end

        # Query
        def find_all_tasks
          Task::Infra::Queries::TasksQuery.find_all_tasks
        end
      end
    end
  end
end
