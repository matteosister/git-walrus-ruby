require 'rspec'
require 'rack/test'
#require 'minitest/reporters'
require '../app'

#MiniTest::Reporters.use!

set :environment, :test

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should == 'Hello World'
  end
end

#class GitWalrusTest < Test::Unit::TestCase
#  include Rack::Test::Methods
#
#  def app
#    Sinatra::Application
#  end
#
#  def test_my_default
#    get '/'
#    #asse
#    assert last_response.ok?
#    puts last_response.body.must_match 'GitWalrus'
#  end
#end