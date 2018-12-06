package main

import (
	"fmt"
)

func sieve(n int) []int {
	nums := make([]bool, n + 1)
	for i := 3; i <= n; i = i + 2 {
		nums[i] = true
	}

	for i := 3; n >= i * i; i = i + 2 {
		if !nums[i] {
			continue
		}

		for j := i * 3; j <= n; j = j + i * 2 {
			if nums[j] {
				nums[j] = false
			}
		}
	}

	primes := []int{2}
	for i := 3; i <= n; i = i + 2 {
		if nums[i] {
			primes = append(primes, i)
		}
	}
	
	return primes
}

func main() {
	var n int
	fmt.Scan(&n)
	
	primes := sieve(n)
	fmt.Println(len(primes), primes[len(primes)-1])
}
