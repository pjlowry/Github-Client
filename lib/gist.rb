class Gist
  def self.create(options)
    post_response = Faraday.post do |request|
      request.url 'https://api.github.com/gists'
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{GITHUB_USERNAME}:#{GITHUB_PASSWORD}")
      request.body = options.to_json
    end
  end
end