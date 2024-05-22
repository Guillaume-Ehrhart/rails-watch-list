class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
  before_destroy :check_bookmarks

  private

  def check_bookmarks
    if bookmarks.any?
      raise ActiveRecord::InvalidForeignKey, "cannot delete movie as it has associated bookmarks"
    end
  end
end
