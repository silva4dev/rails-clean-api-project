require_relative '../../infra/models/application_record'

module Domain
  module Task
    class SubTask < Infra::Models::ApplicationRecord
      belongs_to :task

      attribute :task_id, :integer
      attribute :name, :string
      attribute :status, :integer, default: 0

    end
  end
end
