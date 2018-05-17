class Movie < ApplicationRecord
  belongs_to :director
  has_many :actor_movies, dependent: :destroy
  has_many :actors, through: :actor_movies
  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
