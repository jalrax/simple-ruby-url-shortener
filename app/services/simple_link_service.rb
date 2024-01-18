class SimpleLinkService
  def initialize(simple_link)
    @simple_link = simple_link
  end

  def get_link
    regex = /(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})(\.[a-zA-Z0-9]{2,})?/
    url_host = @simple_link.url.match(regex)[0]

    url_host + '/' + @simple_link.short_url
  end

  def increment_link_counter
    @simple_link.update_attribute(:click_count, @simple_link.click_count + 1)
  end
end
