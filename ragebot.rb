require 'chatterbot/dsl'

class RageBot
  
  $msg = ["Acho pouco.", "Acho justo.", "Tem mais que se arrombar.", "Bem feito."]
  $bot = Chatterbot::Bot.new
  $already_replied = ["sample"]
  
  def initialize(query)
    $bot.search(query) do |tweet|
      rmsg = $msg[rand(4)]
      unless $already_replied.include?(tweet[:text])
        $bot.reply "#{tweet_user(tweet)} #{rmsg}", tweet
        $already_replied << tweet[:text]
        puts "Respondi #{tweet[:text]} com #{rmsg}"
      end
    end
  end
end

loop do
  r = RageBot.new('"pqp que merda"')
  r2 = RageBot.new('"me arrombei"')
  r3 = RageBot.new('"me fudi na prova"')
  r4 = RageBot.new('"me fodi na prova"')
  r5 = RageBot.new('"pqp, que merda"')
  sleep(600)
end