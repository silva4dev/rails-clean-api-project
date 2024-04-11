require_relative "../../domain/task"
require_relative "../../domain/sub_task"

module Task
  module Infra
    module Queries
      class TasksQuery < Task::Domain::Task
        class << self
          def find_all_tasks
            self.all.to_json(include: [:sub_tasks])
          end
        end
      end
    end
  end
end
