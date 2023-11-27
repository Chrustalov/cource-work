class WorkingHour < ApplicationRecord
  belongs_to :working_day
  has_one :appointment
  after_create :configuring_hour

  enum status: { free: 0, busy: 1, visited: 2 }

  validates_uniqueness_of :hour, scope: :working_day_id

  def hour_passed
    self.hour < DateTime.current ? update(hour_gone: true) : update(hour_gone: false)
  end

  private

  def configuring_hour
    current_date = DateTime.now
    current_date = current_date - current_date.wday + DAYS_HASH[self.working_day.name]
    datetime = DateTime.parse("#{current_date.strftime('%Y-%m-%d')} #{self.hour.strftime("%H:%M")} #{current_date.zone}")
    self.update(hour: datetime)
  end
end
