require 'spec_helper'

describe Gist do
  context '.create' do
    it 'POSTs a new Gist to the user\'s account' do
      gist = {:public => 'true',
              :description => 'a test gist',
              :files => {'test_file.rb' => {:content => 'puts "hello world!"'}}}

      bla = stub_request(:post, "https://pjlowry:spring00@api.github.com/gists").
         with(:body => {"{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file\":{\"content\":\"puts \\\"hello world!\\\"\"}}}"=>true},
              :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => "", :headers => {})
      Gist.create(gist)
      bla.should have_been_requested   
           
      # fill in your WebMock stub here

      # Gist.create(gist).post_body.should == ""
    end

    stub_request(:post, "www.example.com").
    with(:body => /^.*world$/, :headers => {"Content-Type" => /image\/.+/}).to_return(:body => "abc")

    uri = URI.parse('http://www.example.com/')
    req = Net::HTTP::Post.new(uri.path)
    req['Content-Type'] = 'image/png'
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req, 'hello world')}   


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