class CommunicationMedia
  attr_reader :p, :alpha, :beta

  def initialize(p, a, b)
    @p = p
    @a = a
    @b = b
    @alpha = additional_param_for @a
    @beta = additional_param_for @b
  end

  def count_next_message_for(m, k)
    (m ** k) % @p
  end

  def count_previous_message_for(m, k)
    for i in 1..@p
      return i if m == ((i ** k) % @p)
    end
  end

  def make_test_with(m)
    puts 'Initial data:'
    puts "p: #{@p}, a: #{@a}, b: #{@b}, alpha: #{@alpha}, beta: #{@beta}"

    messages = calculate_messages_for(m)

    puts "Messages:"
    puts messages.join(' -> ')
  end

  def calculate_messages_for(m, number=0)
    case number
      when 0
        m0 = m
        m1 = count_next_message_for(m, @a)
        m2 = count_next_message_for(m1, @b)
        m3 = count_next_message_for(m2, @alpha)
        m4 = count_next_message_for(m3, @beta)
      when 2
        m2 = m
        m1 = count_previous_message_for(m, @b)
        m0 = count_previous_message_for(m1, @a)
        m3 = count_next_message_for(m, @alpha)
        m4 = count_next_message_for(m3, @beta)
      when 3
        m3 = m
        m2 = count_previous_message_for(m3, @alpha)
        m1 = count_previous_message_for(m2, @b)
        m0 = count_previous_message_for(m1, @a)
        m4 = count_next_message_for(m3, @beta)
      else
        raise 'Invalid message number. Only 0, 2, 3 are allowed.'
    end
    [m0, m1, m2, m3, m4]
  end

  private
  def additional_param_for(num)
    for i in 1..(@p-1)
      return i if (num*i > @p-1) && (num*i)%(@p-1) == 1
    end
    0
  end
end