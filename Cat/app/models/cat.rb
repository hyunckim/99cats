class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, presence: true
  validates :sex, inclusion: { in: %w(M, F) }, length: { is: 1 }, presence: true
end
