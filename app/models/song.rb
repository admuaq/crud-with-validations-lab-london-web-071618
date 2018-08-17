class Song < ActiveRecord::Base
validates :title, presence: true
validates :release_year, presence: true, if: :released, confirmation: true
validates :release_year, numericality: { less_than_or_equal_to: 2018 }, if: :released, confirmation: true
validates :release_year, uniqueness: true


end
