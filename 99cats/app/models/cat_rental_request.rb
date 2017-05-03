class CatRentalRequest < ActiveRecord::Base
  validates :status, presence: true, inclusion: ['PENDING', 'APPROVED', 'DENIED']
  validates :cat_id, presence: true
  validates :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat

  def overlapping_requests
    # we are trying to validate self
    CatRentalRequest.where("cat_id = ?", self.cat_id)
      .where("start_date < ? AND end_date > ?", self.end_date, self.start_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:start_date] << "Overlapping existing rental for #{self.cat.name}"
    end
    true
  end

  def deny!
    debugger
    self.status = "DENIED"
    self.save
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED"
      self.save
      overlapping_pending_requests.each {|el| el.deny!}
    end
  end



end
