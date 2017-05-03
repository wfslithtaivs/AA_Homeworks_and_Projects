class Cat < ActiveRecord::Base
  validates :color, inclusion: ['white', 'black', 'orange', 'blank']
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: ['M', 'F', 'B']

  has_many :rentals, :dependent => :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest

  def age
    cur = Time.now.year
    cur - birth_date.year
  end
end
