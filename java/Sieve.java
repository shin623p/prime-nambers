import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Sieve {
    private static ArrayList<Integer> sieve(int n) {
        boolean[] nums = new boolean[n+1];
        Arrays.fill(nums, true);
        
        for (int i = 3; n >= i * i; i = i + 2) {
            if (!nums[i]) continue;
            for (int j = i * 3; j <= n; j = j + i * 2) {
                if (nums[j]) nums[j] = false;
            }
        }

        ArrayList<Integer> primes = new ArrayList<>();
        primes.add(2);
        for (int i = 3; i <= n; i = i + 2) {
            if (nums[i]) primes.add(i);
        }

        return primes;
    }
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        
        ArrayList<Integer> primes = sieve(n);

        System.out.println( primes.size() + " " + primes.get(primes.size() - 1) );
    }
}
