class Commit < ActiveRecord::Base
  attr_accessible :author, :message, :notified, :time, :url

  scope :not_notified, where(notified: false)

  def updated_attributes_from_hook(json)
    self.author  = json['author']['name']
    self.message = json['message']
    self.time    = Time.parse json['timestamp']
    self.url     = json['url']
    self
  end
  
end
