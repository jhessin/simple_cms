# frozen_string_literal: true

class SectionEdit < ApplicationRecord
  belongs_to :admin_user
  belongs_to :section
end
