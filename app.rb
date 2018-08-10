require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    #render index
    :index
  end
end
