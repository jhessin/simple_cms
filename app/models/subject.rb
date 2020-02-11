# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :pages

  validates_presence_of :name

  # scope :visible, -> { where(visible: true) }
  # scope :invisible, -> { where(visible: false) }
  # scope :sorted, -> { order('position ASC') }
  # scope :newest_first, -> { order('created_at DESC') }
  # scope :search, lamda { |query| where(['name LIKE ?', "%#{query}%"]) }
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
