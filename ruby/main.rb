require './sieve'

primes = sieve(gets.to_i)
puts sprintf("%d %d", primes.length, primes.last)
