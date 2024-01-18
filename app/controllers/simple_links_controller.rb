class SimpleLinksController < ApplicationController
  before_action :get_simple_link, only: [:get_url, :get_url_stats]

  def add_url
    @simple_link = SimpleLink.create!(url: clean_params)
    render json: @simple_link.short_url
  end

  def get_url
    ClickIncrement.new(@simple_link).increment_link_counter
    render json: @simple_link.url
  end

  def get_url_stats
    render json: @simple_link.click_count
  end

  private

  def get_simple_link
    @simple_link = SimpleLink.find_by_short_url(params[:short_url])
    raise ActionController::RoutingError, 'Not Found' if @simple_link.nil?
  end

  def clean_params
    params.permit![:url]
  end
end
