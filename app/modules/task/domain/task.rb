require_relative "../../shared/models/application_record"

module Task
  module Domain
    class Task < Shared::Models::ApplicationRecord
      has_many :sub_tasks

      attribute :user_id, :integer
      attribute :name, :string
      attribute :status, :integer, default: 0
    end
  end
end
