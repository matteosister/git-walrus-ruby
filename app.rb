require 'sinatra'
require 'grit'
require 'haml'

@repo = Grit::Repo.new File.realdirpath(__dir__)
puts @repo.commits.first
@tree = Grit::Tree.create(@repo, {})
puts @tree.contents
#@tree/'/'.contents.each do |child|
#  puts child
#end

before do
  @repo = Grit::Repo.new File.realdirpath(__dir__)
end

get '/' do
  haml :homepage, :repo => @repo
end


#require 'sinatra/base'
#
#class Walrus < Sinatra::Base
#  get '/' do
#    render :index
#  end
#
#  run! if app_file == $0
#end