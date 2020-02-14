# frozen_string_literal: true

class Page < ApplicationRecord
  acts_as_list scope: :subject

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users

  validates :name,
            presence: true,
            length: { maximum: 255 }

  validates :permalink,
            # Use presence_of with length_of to disallow spaces
            presence: true,
            length: { within: 3..255 },
            # for unique values by subject use 'scope: :subject_id'
            uniqueness: true

  class << self
    def visible
      where(visible: true)
    end

    def invisible
      where(visible: false)
    end

    def sorted
      order(:position)
    end

    def newest_first
      order(created_at: :desc)
    end

    def search(query)
      where(['name LIKE ?', "%#{query}%"])
    end
  end
end
