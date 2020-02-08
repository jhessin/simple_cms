# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :admin_users, through: :section_edits

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
