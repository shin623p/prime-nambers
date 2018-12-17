import math

def sieve(n):
    nums = list(range(n + 1))
    for i in range( 3, math.ceil( n**0.5 ), 2):
        if nums[i] == 0:
            continue
        for j in range( i * i, n, i * 2 ):
            if nums[j] != 0:
                nums[j] = 0

    return [2] + list( filter( lambda x: x % 2 != 0 and x > 2, nums ) )

primes = sieve( int(input()) )
print( '{} {}'.format(len(primes), primes[-1]) )
