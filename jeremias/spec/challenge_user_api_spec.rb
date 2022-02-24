describe Placeholder do
  context '#User' do
    context 'create user' do
      context 'when success' do
        let(:params) do
          {
            name: 'Lorem Ipsum',
            username: 'lorem_ipsum',
            email: 'Lucio_Hettinger@annie.ca',
            address: {
              street: 'Skiles Walks',
              suite: 'Suite 351',
              city: 'Roscoeview',
              zipcode: '33263',
              geo: { lat: '-31.8129', lng: '62.5342' }
            },
            phone: '(254)954-1289',
            website: 'demarco.info',
            company: {
              name: 'Keebler LLC',
              catchPhrase: 'User-centric fault-tolerant solution',
              bs: 'revolutionize end-to-end systems'
            }
          }
        end

        subject do
          VCR.use_cassette('user_create') { Placeholder::User.create(params) }
        end

        it 'should be ok' do
          is_expected.to include(:id)
          is_expected.to include(name: 'Lorem Ipsum')
          is_expected.to include(username: 'lorem_ipsum')
        end
      end
    end

    context '.update' do
      let(:id) { 5 }
      let(:params) do
        { email: 'jeremias@me.com', lat: '123', lng: '321' }
      end

      subject do
        VCR.use_cassette('user_update') { Placeholder::User.update(5, params) }
      end

      let(:result) do
        { id: 5, email: 'jeremias@me.com', address: {get: {lat: '123', lng: '321' } } }
      end

      it 'should be updated' do
        is_expected.to include(result)
      end
    end
  end
end
