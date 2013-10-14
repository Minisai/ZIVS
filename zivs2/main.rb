require "./communication_media"
require "./spectator"

p = 23
m = 17
a = 5
b = 7
m_number = 2

communication_media = CommunicationMedia.new(p, a, b)
#communication_media.make_test_with(m)

messages = communication_media.calculate_messages_for(m)
spectator = Spectator.new(p, messages[m_number], 2)
spectator.hack