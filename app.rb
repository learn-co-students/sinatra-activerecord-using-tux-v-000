require_relative 'config/environment'
#David was here
class App < Sinatra::Base
  get '/' do
    :index
  end
end
