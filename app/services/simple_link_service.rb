require 'uri'

class SimpleLinkService
  def initialize(simple_link)
    @simple_link = simple_link
  end

  def get_link
    uri = URI.parse(@simple_link.url)
    host = [uri.scheme, uri.host].join('://')
    File.join(host, @simple_link.short_url)
  end

  def increment_link_counter
    @simple_link.update_attribute(:click_count, @simple_link.click_count + 1)
  end
end
