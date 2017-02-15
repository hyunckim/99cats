class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }, presence: true
  validate :correct_start_end_date, :no_overlap_cats

  def no_overlap_cats
    cats = CatRentalRequest.where(cat_id: cat_id).where(status: "APPROVED")
    cats.each do |cat|
      if cat.start_date > self[:start_date] && cat.end_date > self[:end_date]
        errors[:end_date] << "overlaps"
        return false
      elsif cat.start_date < self[:start_date] && cat.end_date < self[:end_date]
        errors[:start_date] << "overlaps"
        return false
      elsif cat.start_date > self[:start_date] && cat.end_date < self[:end_date]
        errors[:date] << "overlaps"
        return false
      end
    end
    true
  end

  def correct_start_end_date
    if :end_date > :start_date
      errors[:end_date] << "cannot be before start date"
      return false
    else
      return true
    end
  end

  belongs_to :cat

end
