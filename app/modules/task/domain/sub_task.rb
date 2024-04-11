require_relative "../../shared/models/application_record"

module Task
  module Domain
    class SubTask < Shared::Models::ApplicationRecord
      belongs_to :task

      attribute :task_id, :integer
      attribute :name, :string
      attribute :status, :integer, default: 0
    end
  end
end
