# frozen_string_literal: true

# Hold information pertaining to a user
class AdminUser < ApplicationRecord
  # @type [Symbol]
  # self.table_name = :admin_users
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits
end
