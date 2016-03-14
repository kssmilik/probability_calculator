# Finds by using the normal distribution
# The value will be approximate, tending to exact value

module ProbabilityViaDistribution
  SIDES = 6

  def via_distribution_with_benchmark(n, sum)
    Benchmark.bm { |x| x.report { @probability = via_distribution(n, sum) } }
    puts "Probability get #{sum} with #{n} dices: #{@probability} \n\n"
  end

  def via_distribution(n, sum)
    @n, @sum = n, sum

    return 0 if @sum < @n || @sum > @n * SIDES
    return 1 if @sum == @n || @sum == @n * SIDES

    below_the_sum = get_value_for(@sum - 0.5)
    above_the_sum = get_value_for(@sum + 0.5)

    probability(below_the_sum) - probability(above_the_sum)
  end

  private

  def coefficient
    1 / Math.sqrt(2 * Math::PI)
  end

  def mean(&block)
    (1..SIDES).inject(&(block_given? ? block : :+)) / SIDES.to_f
  end

  def variance
    mean { |sum, side| sum + side**2 } - mean**2
  end

  def sigma
    (@n * variance)**0.5
  end

  def get_value_for(sum)
    (sum - @n * mean) / sigma.to_f
  end

  def probability(z)
    factorial_k = 1
    term = 1
    sum  = 0
    k    = 0

    loop_stop = Math.exp(-22)
    while term.abs > loop_stop
      term = calculate_term(k, z, factorial_k)
      sum += term
      k += 1
      factorial_k *= k
    end

    sum += 0.5
    1 - sum
  end

  def calculate_term(k, z, factorial_k)
    coefficient * (-1)**k * z**k / (2 * k + 1) / 2**k * z**(k + 1) / factorial_k
  end
end
