class SimpleLink < ApplicationRecord
  before_validation :shorten_url

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :url, :short_url

  def shorten_url
    self.short_url = SecureRandom.uuid[0..5] if self.short_url.nil? || self.short_url.empty?
    true
  end
end
