class Job < ActiveRecord::Base
  before_validation_on_create :set_expires_on

  validates_presence_of :subject, :description, :organization

  def self.index
    active.newest_first
  end

  protected

  def self.active
    where('jobs.expires_on > :now', :now => Time.now)
  end

  def self.newest_first
    order('jobs.created_at DESC')
  end

  def set_expires_on
    self.expires_on ||= 2.weeks.from_now
  end
end
