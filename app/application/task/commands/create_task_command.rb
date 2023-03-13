module Application
  module Task
    module Commands
      class CreateTaskCommand
        attr_accessor :user_id, :name, :status

        def initialize(user_id:, name:, status:)
          @user_id = user_id
          @name = name
          @status = status
        end
      end
    end
  end
end