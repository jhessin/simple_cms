# frozen_string_literal: true

# Hold information pertaining to a user
class User < ApplicationRecord
  # @type [Symbol]
  self.table_name = :admin_users
end
