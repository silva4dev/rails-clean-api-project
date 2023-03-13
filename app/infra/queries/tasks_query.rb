require_relative '../../domain/task/task'
require_relative '../../domain/task/sub_task'

module Infra
  module Queries
    class TasksQuery < Domain::Task::Task
      class << self
        # TODO：本来はpresenterでjson化するのがいいんだけど上手い取り方わからない
        def find_all_tasks
          self.all.to_json(include: [:sub_tasks])
        end
      end
    end
  end
end
