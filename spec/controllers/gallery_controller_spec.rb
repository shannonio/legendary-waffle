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
end
