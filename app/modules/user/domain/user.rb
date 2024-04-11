require_relative "../../shared/models/application_record"

module User
  module Domain
    class User < Shared::Models::ApplicationRecord
      attribute :name, :string
      attribute :mail_address, :string
    end
  end
end
