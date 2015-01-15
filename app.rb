require 'bundler/setup'
require 'sinatra/base'
require 'sinatra-index'

$stdout.sync = true

class MyApp < Sinatra::Base

	set :public_folder, './public'

	# set port for foreman/heroku - see Procfile
	set :port, ARGV[1] if ARGV[1]

	register Sinatra::Index
	use_static_index 'index.html'

	get '/' do
	  redirect '/index.html'
	end

end

if __FILE__ == $0
  MyApp.run!
end