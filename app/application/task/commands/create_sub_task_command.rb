module Application
  module Task
    module Commands
      class CreateSubTaskCommand
        attr_accessor :task_id, :name, :status

        def initialize(task_id:, name:, status:)
          @task_id = task_id
          @name = name
          @status = status
        end
      end
    end
  end
end
