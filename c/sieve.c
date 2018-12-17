#include <stdio.h>
#include <stdlib.h>

char* sieve(char *nums, int max){
  for(int i = 3; max >= i * i; i = i + 2){
    if (!nums[i]) continue;
    for(int j = i * i; j <= max; j = j + i * 2){
      if (nums[j]) nums[j] = 0;
    }
  }
  return nums;
}

int count_prime(char *nums, int max){
  int cnt = 1;
  for(int i = 3; i <= max; i = i + 2){
    if (nums[i]) cnt++;
  }
  return cnt;
}

int* gen_primes(char *nums, int *primes, int prime_cnt){
  primes[0] = 2;
  for(int i = 3, j = 1; j <= prime_cnt; i = i + 2) {
    if (nums[i]) primes[j++] = i;
  }
  return primes;
}

int main(void){
  char *nums;
  int *primes;

  int n;
  scanf("%d", &n);
  
  nums = malloc(sizeof(char) * n + 1);
  for(int i = 3; i <= n; i = i + 2) nums[i] = 1;

  int len = count_prime( sieve(nums, n), n );
  primes = malloc(sizeof(int) * len); 
  
  printf("%d %d\n", len, gen_primes(nums, primes, len)[len - 1]);
  
  free(nums);
  free(primes);

  return(0);
}
