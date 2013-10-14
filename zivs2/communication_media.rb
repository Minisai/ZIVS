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
    puts "p: #{@p}"
    puts "a: #{@a}"
    puts "b: #{@b}"
    puts "alpha: #{@alpha}"
    puts "beta: #{@beta}"

    m1 = count_next_message_for(17, @a)
    m2 = count_next_message_for(m1, @b)
    m3 = count_next_message_for(m2, @alpha)
    m4 = count_next_message_for(m3, @beta)

    puts "M: #{m}"
    puts "M1: #{m1}"
    puts "M2: #{m2}"
    puts "M3: #{m3}"
    puts "M4: #{m4}"
  end

  private
  def additional_param_for(num)
    for i in 1..(@p-1)
      return i if (num*i > @p-1) && (num*i)%(@p-1) == 1
    end
    0
  end
end