require_relative './spec_helper'

require 'rack/client'
require 'rack/fake_method'

class FakeApp
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, [env['REQUEST_METHOD']]]
  end
end

HTTP_METHODS = %w{GET POST PUT DELETE HEAD OPTIONS PATCH}

describe Rack::FakeMethod do
  before do
    @client = Rack::Client.new do
      use Rack::FakeMethod::Middleware
      run FakeApp.new
    end
  end

  it "runs all normal methods just fine" do
    HTTP_METHODS.each do |method|
      @client.request(method.downcase, '/').body.must_equal method
    end
  end

  it "does not fake the method when the original method is not POST" do
    HTTP_METHODS.each do |method|
      next if method == 'POST'
      @client.request(method.downcase, '/', 'FAKE-METHOD' => 'POST').body.must_equal method
    end
  end

  it "fakes the method when the original is POST" do
    HTTP_METHODS.each do |method|
      next if method == 'POST'
      @client.post('/', 'FAKE-METHOD' => method).body.must_equal method
    end
  end
end