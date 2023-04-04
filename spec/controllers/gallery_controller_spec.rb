require 'rails_helper'

describe GalleryController, type: :controller do
  render_views

  describe '#index' do
    it 'renders images' do
      get :index
      expect(response).to be_successful
      images = response.body.split("\n").select { |line| (line =~ /img /).present? }
      expect(images.count).to eq(30)
    end
  end

  describe '#show' do
    it 'renders an image' do
      params = { 'id': '1' }
      get :show, params: params
      expect(response).to be_successful
      image = response.body.split("\n").select { |line| (line =~ /img /).present? }
      expect(image.count).to eq(1)
    end
  end
end
