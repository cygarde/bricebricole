require 'twilio-ruby'

class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def send_text(user, message)
    client.api.account.messages.create(
      to: user.telephone_2,
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "Bonjour Monsieur, je ne pourrai malheureusement pas terminer la tâche aujourd'hui."
    )
  end
end
