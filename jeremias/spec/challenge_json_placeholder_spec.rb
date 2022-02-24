describe 'Visit jsonplaceholder' do
  context 'Navigation on photos link' do
    let(:photo_id) { 6 }
    let(:albumId) { 1 }
    let(:title) { 'accusamus ea aliquid et amet sequi nemo' }
    let(:url) { 'https://via.placeholder.com/600/56a8c2' }
    let(:thumbnailUrl) { 'https://via.placeholder.com/150/56a8c2' }

    it 'should be truth' do
      visit('/guide')

      expect(page).to have_content('You can copy paste the code in your browser console to quickly test JSONPlaceholder.')

      click_link('/albums/1/photos')

      expect(page).to have_selector(:xpath, "//pre")

      content = find('pre').text

      photos = JSON.parse(content)

      expect(photos).not_to be_empty

      photo = photos.find { |picture| picture['id'] == photo_id }

      expect(photo).not_to be_nil

      expect(photo).to include('albumId' => albumId)
      expect(photo).to include('title' => title)
      expect(photo).to include('url' => url)
      expect(photo).to include('thumbnailUrl' => thumbnailUrl)
    end
  end
end
