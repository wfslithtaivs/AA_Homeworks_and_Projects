# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Executive < ActiveRecord::Base
  has_many :executives,
    primary_key: :id,
    foreign_key: :member_id,
    class_name: :Executive

    has_many :memberships,
      primary_key: :id,
      foreign_key: :member_id,
      class_name: :Board

    has_many :boards,
      through: :memberships,
      source: :board

end
