# Counts ways of getting needed sum, and then uses the simple probability formula

module ProbabilityViaCombinations
  SIDES = 6

  def via_combinations_with_benchmark(n, sum)
    Benchmark.bm { |x| x.report { @probability = via_combinations(n, sum) } }
    puts "Probability get #{sum} with #{n} dices: #{@probability} \n\n"
  end

  def via_combinations(n, sum)
    return 0 if sum < n || sum > n * SIDES
    return 1 if sum == n || sum == n * SIDES

    sums(n, sum).to_f / SIDES**n
  end

  private

  def sums(n, sum, combinations = {})
    count = 0

    return 0 if sum <= 0 || n <= 0
    return sum >= 1 && sum <= SIDES ? 1 : 0 if n == 1
    return combinations["#{n}-#{sum}"] if combinations.key?("#{n}-#{sum}")

    (1..SIDES).count { |i| sums(n - 1, sum - i, combinations) }
    combinations["#{n}-#{sum}"] = count
    count
  end
end
