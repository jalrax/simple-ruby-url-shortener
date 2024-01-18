require 'rails_helper'

RSpec.describe SimpleLinksController do
  describe '#get_url' do
    let(:simple_link) { create :simple_link }
    subject { get "/urls/#{simple_link.short_url}" }
    before { subject }

    it 'should return a success responce' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return a long url' do
      long_url = simple_link.url

      expect(response.body).to match long_url
    end

    it 'should increase counter by 1' do
      new_link = create :simple_link
      counter = new_link.click_count

      get "/urls/#{new_link.short_url}"
      new_link.reload

      expect(new_link.click_count).to eq counter + 1
    end
  end

  describe '#get_url_stats' do
    let(:simple_link) { create :simple_link }
    subject { get "/urls/#{simple_link.short_url}/stats" }
    before { subject }

    it 'should return simple_link click count' do
      expect(response.body).to eq '0'
    end
  end
end
