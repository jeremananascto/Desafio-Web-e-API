module Placeholder
  class User
    def self.create(params)
      response = connection.post('/users', params.to_json)

      raise 'error' unless response.status == 201

      JSON.parse(response.body, symbolize_names: true)
    end

    def self.update(id, email:, lat:, lng:)
      params = {
        email: email,
        address: { get: { lat: lat, lng: lng } }
      }

      response = connection.put("/users/#{id}", params.to_json)

      raise 'error' unless response.status == 200

      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.connection
      Placeholder::Client.new.connection
    end
  end
end
