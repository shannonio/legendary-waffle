class GalleryController < ApplicationController
  PICSUM_URL = 'https://picsum.photos'
  def index
    @photos = client.get('v2/list')&.body
  end

  private

  def client
    @client ||= Faraday.new(
        url: PICSUM_URL,
        headers: { 'Content-Type': 'application/json' }
      ) do |conn|
        conn.response :json
      end
  end
end
