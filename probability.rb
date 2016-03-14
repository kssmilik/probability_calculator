require 'benchmark'
require './probability_via_distribution.rb'
require './probability_via_combinations.rb'

class Probability

  extend ProbabilityViaDistribution
  extend ProbabilityViaCombinations

  # via_distribution(n, m)
  # via_distribution_with_benchmark(n, m)

  # via_combinations_with_benchmark(n, m)
  # via_combinations(n, m)

  def self.check
    puts '-------------------- VIA DISTRIBUTION --------------------'

    via_distribution_with_benchmark(100, 100)
    via_distribution_with_benchmark(100, 600)
    via_distribution_with_benchmark(100, 350)
    via_distribution_with_benchmark(300, 1000)

    puts '-------------------- VIA COMBINATIONS --------------------'

    via_combinations_with_benchmark(100, 100)
    via_combinations_with_benchmark(100, 600)
    via_combinations_with_benchmark(100, 350)
    via_combinations_with_benchmark(300, 1000)

    puts '-------------------- ----------------- --------------------'
  end

end

Probability.check
