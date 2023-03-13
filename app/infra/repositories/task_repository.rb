require_relative '../../domain/task/task_repository_IF'

# 実装class
module Infra
  module Repositories
    class TaskRepository < Domain::Task::TaskRepositoryIF
      # task
      def save(task)
        task.save
      end

      def update(task)
        raise "Not implemented yet"
      end

      def delete(task)
        raise "Not implemented yet"
      end

      # sub_task
      def save_sub_task(sub_task)
        sub_task.save
      end
    end
  end
end