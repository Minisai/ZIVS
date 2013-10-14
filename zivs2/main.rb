require "./communication_media"
require "./spectator"

p = 23
m = 17
a = 5
b = 7

communication_media = CommunicationMedia.new(p, a, b)
communication_media.make_test_with(m)

spectator = Spectator.new(p, m, 2)
spectator.hack