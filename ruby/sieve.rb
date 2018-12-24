def sieve(n)
  nums = (0..n).to_a
  nums[0] = nil
  nums[1] = nil
  4.step(n, 2) do |i|
    nums[i] = nil
  end
  3.step( (n ** 0.5).floor, 2) do |i|
    next unless nums[i]
    
    (i * i).step(n, i + i) do |j|
      nums[j] = nil
    end
  end
  nums.compact!
end

def is_prime(n)
  return false if n <= 1
  return true if n <= 3
  sieve( (n ** 0.5).floor ).each do |i|
    return false if (n % i == 0)
  end
  return true
end
