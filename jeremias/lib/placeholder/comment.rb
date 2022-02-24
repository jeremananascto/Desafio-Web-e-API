module Placeholder
  class Comment
    def all
      response = connection.get('/comments')
      raise 'Not found' unless response.success?

      JSON.parse(response.body, symbolize_names: true)
    end

    def find_by_name(name)
      comments = all
      comments.find { |comment| comment[:name] == name }
    end

    private

    def connection
      Placeholder::Client.new.connection
    end
  end
end
