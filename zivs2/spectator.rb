require "./communication_media"

class Spectator
  def initialize(p, message, number = 2)
    @p = p
    @message = message
    @number = number
  end

  def hack
    keys_amount = 0

    for a in 1...(@p-1)
      for b in 1...(@p-1)
        test_media = CommunicationMedia.new(@p, a, b)
        messages = test_media.calculate_messages_for(@message, @number)

        if messages[0] == messages[4]
          puts '!!!KEYS FOUND!!!'
          keys_amount += 1
          test_media.make_test_with(messages[0])
          puts 'type anything to continue'
          gets
        end
      end
    end

    puts "Search is completed. Found #{keys_amount} keys"
  end
end