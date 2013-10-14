require "./communication_media"

class Spectator
  def initialize(p, message, number = 2)
    @p = p
    @message = message
    @number = number
  end

  def hack
    for a in 1..@p
      for b in 1..@p
        test_media = CommunicationMedia.new(@p, a, b)
        m1 = test_media.count_previous_message_for(@message, b)
        m = test_media.count_previous_message_for(m1, a)
        m3 = test_media.count_next_message_for(@message, test_media.alpha)
        m4 = test_media.count_next_message_for(m3, test_media.beta)

        if m == m4
          puts 'SUCCESS'
          test_media.make_test_with(m)
          puts 'type anything to continue'
          gets
        end
      end
    end

    puts 'FAIL'
    false
  end
end