
class Hangman
  attr_accessor :word, :choice, :message, :blanks, :wrong_letters, :wrong

  def pick_random_line
    word = ""
    until word.length < 12 && word.length > 5
      word = File.readlines("5desk.txt").sample
    end
    word
  end

  def initialize
    pick_random_line
    @word = pick_random_line.downcase.strip.split('')
    @wrong_letters = []
    @wrong = 0
    @blanks = Array.new(@word.length, "_")
    @message = ""  
  end

  def guess(choice)  
    if choice =~/[a-z]/
      if @wrong_letters.include?(choice) || @blanks.include?(choice)
        @message = "You already guessed that one..."
      elsif @word.include?(choice)
        @word.each_with_index do |letter, index|
          if letter == choice
            @blanks[index] = choice
            check_win
          end
        end
      else
        @wrong_letters << choice
        @wrong += 1
        check_win
      end
    else
      @message = 'Please choose a letter a-z'
    end
  end

  def check_win
    if @wrong == 10
      @message = "The word we were looking for was [#{@word.join}]"
    elsif @word == @blanks
      @message = '-YOU WIN!-'
    else
      @message = ""
    end
  end
 
end