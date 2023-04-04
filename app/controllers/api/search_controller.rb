class Api::SearchController < ApplicationController
  PICSUM_URL = 'https://picsum.photos'
  def index
    @photos = params["search"].present? ? photos.select { |p| p["author"].include?(params["search"]) } : photos
    render json: @photos
  end

  def photos
    @photos ||= client.get('v2/list')&.body
  end

  def client
    @client ||= Faraday.new(
        url: PICSUM_URL,
        headers: { 'Content-Type': 'application/json' }
      ) do |conn|
        conn.response :json
      end
  end
end
