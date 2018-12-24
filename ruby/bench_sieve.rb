require 'benchmark'
require './sieve'

[100, 1000, 10000, 100000, 1000000, 10000000, 100000000].each do |n|
  t = Benchmark.realtime do
    sieve(n)
  end
  puts "N=#{n}: #{t}s"
end

n=99999999999973
t = Benchmark.realtime do
  is_prime(n)
end
puts "n=#{n}, time=#{t}"
