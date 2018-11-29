def sieve(n)
  nums = (0..n).to_a
  3.step( (n ** 0.5).ceil, 2) do |i|
    next unless nums[i]
    
    (i + i + i).step(n, i + i) do |j|
      nums[j] = 0 if nums[j]
    end
  end
  [2] + nums.select { |x| x % 2 != 0 && x > 2 }
end

primes = sieve(gets.to_i)
puts sprintf("%d %d", primes.length, primes.last)
