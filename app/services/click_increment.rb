class ClickIncrement
  def initialize(simple_link)
    @simple_link = simple_link
  end

  def increment_link_counter
    @simple_link.update_attribute(:click_count, @simple_link.click_count + 1)
  end
end
