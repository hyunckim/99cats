class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, presence: true
  validates :sex, inclusion: { in: %w(M F) }, presence: true

  has_many :cat_rental_requests
end
