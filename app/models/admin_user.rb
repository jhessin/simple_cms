# frozen_string_literal: true

# Hold information pertaining to a user
class AdminUser < ApplicationRecord
  # @type [Symbol]
  # self.table_name = :admin_users
  has_secure_password
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i.freeze
  FORBIDDEN_USERNAMES = %w[littlebopeep humptydumpty marymary].freeze

  class << self
    def sorted
      order 'last_name ASC, first_name ASC'
    end
  end

  validates :first_name,
            presence: true,
            length: {
              maximum: 25
            }

  validates :last_name,
            presence: true,
            length: {
              maximum: 50
            }

  validates :username,
            presence: true,
            length: {
              within: 8..25
            },
            uniqueness: true

  validates :email,
            presence: true,
            length: {
              maximum: 100
            },
            format: EMAIL_REGEX,
            confirmation: true

  validate :username_allowed

  def name
    "#{first_name} #{last_name}"
  end

  private

  def username_allowed
    return unless FORBIDDEN_USERNAMES.include? username

    errors.add :username, 'has been restricted from use'
  end
end
