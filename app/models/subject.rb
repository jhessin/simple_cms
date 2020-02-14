# frozen_string_literal: true

class Subject < ApplicationRecord
  acts_as_list

  has_many :pages

  validates :name,
            presence: true,
            length: { in: 3..255 }

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
