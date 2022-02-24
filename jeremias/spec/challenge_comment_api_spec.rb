describe Placeholder do
  context 'Comment' do
    context '#find_by_name' do
      subject do
        VCR.use_cassette('comments') { Placeholder::Comment.new.find_by_name(name) }
      end

      context 'when find its OK' do
        let(:name) { 'alias odio sit' }

        let(:result_success) do
          {
            postId: 1,
            id: 4,
            name: 'alias odio sit',
            email: 'Lew@alysha.tv',
            body: "non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati"
          }
        end

        it 'success when find by name' do
          is_expected.to include(result_success)
        end

        it 'when result is different' do
          is_expected.not_to include({ postId: 2, id: 5, name: 'teste', email: 'teste@me.com', body: 'teste' })
        end
      end

      context 'when object is not found' do
        let(:name) { 'jeremias' }

        it 'should be return nil' do
          is_expected.to be_nil
        end
      end
    end
  end
end
