class Plan < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validate :finish_today_check
  validate :finish_start_check

  def finish_today_check
    if finish_date.blank?
      return
    elsif finish_date < Date.today
      errors.add(:finish_date, "は今日以降のものを選択してください")
    end
  end
    
  def finish_start_check
    return if start_date.blank? || finish_date.blank?
    if start_date > finish_date
      errors.add(:start_date, "以降に終了日を設定してください")
    end
  end
end
