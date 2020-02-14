# frozen_string_literal: true

class Section < ApplicationRecord
  acts_as_list scope: :page

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, through: :section_edits

  CONTENT_TYPES = %w[text HTML].freeze

  validates :name,
            presence: true,
            length: { maximum: 255 }
  validates_inclusion_of :content_type,
                         in: CONTENT_TYPES,
                         message: "must be one of: #{CONTENT_TYPES.join ', '}"
  validates_presence_of :content

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
