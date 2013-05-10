require 'spec_helper'

describe 'GitWalrus App' do

  it 'should respond to GET on homepage' do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Git Walrus/)
  end

  it 'should respond to GIT on a path' do
    get '/tree/master/src'
    last_response.should be_ok
    last_response.body.should match(/Git Walrus/)
  end
end