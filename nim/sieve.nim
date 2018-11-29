import sequtils, strutils, math

proc sieve (maxnum: int): seq[int] =
  var nums = newSeq[uint8](maxnum + 1)
  
  for i in countup(3, int(ceil(sqrt(float(maxnum)))), 2):
    if nums[i] == 0:
      for j in countup( i * 3, maxnum, i * 2):
        if nums[j] == 0:
          nums[j] = 1

  result = @[2]
  for i in countup(3, maxnum, 2):
    if nums[i] == 0:
      result.add(i)
      
let primes = sieve(readLine(stdin).parseInt)
echo( primes.len, " ", primes[primes.len - 1] )
