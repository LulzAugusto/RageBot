#encoding: utf-8

require 'chatterbot/dsl'

class RageBot

  $msg = ["Acho pouco.", "Acho justo.", "Tem mais que se arrombar.", "Bem feito.", "Ahahaha se fodeu, acho pouco, to rindo mto!!", 'chapéu de otário é marreta, acho é pouco']
  $bot = Chatterbot::Bot.new
  $already_replied = ["sample"]

  def initialize(query)
    begin
      $bot.search(query) do |tweet|
        rmsg = $msg[rand($msg.size)]
        unless $already_replied.include?(tweet[:text])
          $bot.reply "#{tweet_user(tweet)} #{rmsg}", tweet
          $already_replied << tweet[:text]
          puts "Respondi '#{tweet_user(tweet)}': '#{tweet[:text]}' com '#{rmsg}' @" + Time.now.strftime(" %I:%M %p")
        end
      end
    rescue
      puts "Erro"
    end
  end
end

loop do
  queries = ['"pqp que merda"', '"me arrombei"', '"me fudi na prova"', '"me fodi na prova"', '"pqp, que merda", "me dei mal", "me dei mau", "to fudido"']
  queries.each do |query|
    r = RageBot.new(query)
  end
  sleep(600)
end