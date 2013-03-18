require 'spec_helper'

describe Gist do
  context '.create' do
    it 'POSTs a new Gist to the user\'s account' do
      gist = {:public => 'true',
              :description => 'a test gist',
              :files => {'test_file.rb' => {:content => 'puts "hello world!"'}}}

      stub_request(:post, "https://api.github.com/gists").
      with(:body => "hello world!", :headers => { :context_type => 'text/plain' })

      RestClient.post "https://api.github.com/gists", "hello world!", :context_type => 'text/plain'

      WebMock.should have_requested(:post, "https://api.github.com/gists").
      with(:body => "hello world!", :headers => { :context_type => 'text/plain' })   
           
      # fill in your WebMock stub here

      # Gist.create(gist).post_body.should == 'hello world!'
    end


  it 'sample' do
    stub_request(:any, "www.example.com").with(:headers=>{ 'Header-Name' => 'Header-Value' })

    uri = URI.parse('http://www.example.com/')
    req = Net::HTTP::Post.new(uri.path)
    req['Header-Name'] = 'Header-Value'
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req, 'abc') }
    end
  end
end