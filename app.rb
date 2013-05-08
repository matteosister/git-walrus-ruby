require 'rubygems'
require 'sinatra'
require 'grit'
require 'haml'

set :haml, {:format => :html5}
set :scss, {:views => 'scss'}

before do
  @repo = Grit::Repo.new('/home/matteo/libraries/GitElephant')
end

get '/all.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :all, :style => :expanded
end

get '/' do
  haml :homepage, :repo => @repo
end