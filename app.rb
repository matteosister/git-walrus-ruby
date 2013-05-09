require 'rubygems'
require 'sinatra'
require 'grit'
require 'haml'
require 'sass'

set :haml, {:format => :html5}
set :scss, {:views => 'scss'}

#@repo = Grit::Repo.new('/home/matteo/libraries/GitElephant')
#@path = 'src'
#@tree = @repo.tree('develop')/@path
#@tree.trees.each do |t|
#  puts t.name
#end

before do
  @repo = Grit::Repo.new('/home/matteo/libraries/GitElephant')
end

get '/tree/:ref/*' do
  @ref = params[:ref]
  @path = params[:splat].first.to_s
  if 0 === @path.count('/')
    @back = '/'
  else
    newPath = @path.split('/')[0..-2].join('/')
    @back = "/tree/#{ @ref }/#{ newPath }"
  end
  puts @back
  @tree = @repo.tree/@path
  haml :tree
end

get '/all.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :all, :style => :expanded
end

get '/' do
  @ref = 'master'
  @tree = @repo.tree(@ref)
  haml :homepage, :layout => :layout
end