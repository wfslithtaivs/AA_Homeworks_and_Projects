class ShortenedUrl < ApplicationRecord
  validates :long_url, :uniqueness => true
  validates :long_url, :presence => true
  validates :short_url, :uniqueness => true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  def num_clicks
    Visit.count
  end

  def num_uniques
    Visit.select("user_id").distinct.count
  end

  def num_recent_uniques
    Visit.select("user_id").where(created_at: 10.minutes.ago..Time.now).distinct.count
  end

  def self.random_code(user, long_url)
    code = SecureRandom::urlsafe_base64.first(16)
    until !ShortenedUrl.exists?(short_url: code)
      code = SecureRandom::urlsafe_base64.first(16)
    end
    code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: code)
  end
end
