require_relative '../../infra/repositories/task_repository'
require_relative '../../infra/queries/tasks_query'
require_relative '../../domain/task/task'

module Application
  module Task
    class TaskUseCase
      def initialize(repositories = {})
        @task_repository = repositories.fetch(:task) { Infra::Repositories::TaskRepository.new }
      end

      # Command
      def create_task(create_task_command)
        task = Domain::Task::Task.new(
          user_id: create_task_command.user_id,
          name: create_task_command.name,
          status: create_task_command.status
        )

        ActiveRecord::Base.transaction do
          @task_repository.save(task)
          task.id
        end
      end

      def create_sub_task(create_sub_task_command)
        sub_task = Domain::Task::SubTask.new(
          task_id: create_sub_task_command.task_id,
          name: create_sub_task_command.name,
          status: create_sub_task_command.status
        )

        ActiveRecord::Base.transaction do
          @task_repository.save(sub_task)
          sub_task.id
        end
      end

      # Query
      def find_all_tasks
        Infra::Queries::TasksQuery.find_all_tasks
      end
    end
  end
end