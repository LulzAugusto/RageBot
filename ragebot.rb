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
        puts "Respondi #{tweet[:text]} com #{rmsg} "+Time.now.strftime("as %I:%M %p")
      end
    end
  end
end

loop do
  queries = ['"pqp que merda"', '"me arrombei"', '"me fudi na prova"', '"me fodi na prova"', '"pqp, que merda"']
  queries.each do |query|
    r = RageBot.new(query)
  end
  sleep(600)
end