require 'rubygems'
require 'sinatra'
require 'grit'
require 'haml'
require 'sass'
require 'coffee-script'

set :haml, {:format => :html5}
set :scss, {:views => 'assets/scss'}
set :coffee, {:views => 'assets/coffee'}

#@repo = Grit::Repo.new('/home/matteo/libraries/GitElephant')
#@path = 'src'
#@tree = @repo.tree('develop')/@path
#@tree.trees.each do |t|
#  puts t.name
#end

before do
  @repo = Grit::Repo.new('/home/matteo/libraries/GitElephant')
end

get '/tree/:ref' do
  @ref = params[:ref]
  @path = '/'
  @tree = @repo.tree/@path
  haml :tree, :layout => false
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
  @tree = @repo.tree/@path
  haml :tree
end

get '/' do
  @ref = 'master'
  @tree = @repo.tree(@ref)
  haml :homepage, :layout => :layout
end

get '/js/:name' do
  content_type 'text/javascript', :charset => 'utf-8'
  content = File.open(Dir.pwd + '/assets/coffee/' + params[:name].to_s.sub('.js', '.coffee'))
  coffee content.read
end

get '/css/all.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :all, :style => :expanded
end

