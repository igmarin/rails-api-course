# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :slug, :content, presence: true
  validates :slug, uniqueness: true
end
