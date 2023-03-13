require_relative '../../infra/models/application_record'

module Domain
  module Task
    class Task < Infra::Models::ApplicationRecord
      has_many :sub_tasks

      attribute :user_id, :integer
      attribute :name, :string
      attribute :status, :integer, default: 0

    end
  end
end
