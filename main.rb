require 'sinatra'
#require 'sinatra\reloader'


require './lib/hangman'
#http://localhost:4567/?string=&offset=0




game = Hangman.new

get '/' do
  if params["newgame"]
    game = Hangman.new
  end
  choice = params["choice"]
  game.guess(choice)
  wrong_letters = game.wrong_letters.join(" ")
  blanks = game.blanks.join(" ")
  message = game.message
  image = "gallows_#{game.wrong}.png"
  
  erb :index, :locals => {:image => image, :wrong_letters => wrong_letters, :blanks => blanks, :message => message, :choice => choice}
end