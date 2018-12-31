fn sieve(n: u32) -> Vec<u32> {
    let mut nums = vec![true; (n + 1) as usize];

    for i in (3 as usize..).step_by(2) {
        if i * i > n as usize {
            break;
        }

        if !(nums[i]) {
            continue;
        }

        for j in ((i * i)..(n + 1) as usize).step_by(i * 2) {
            if nums[j] {
                nums[j] = false;
            }
        }
    }

    let mut primes = vec![2];

    for i in (3..(n + 1) as usize).step_by(2) {
        if nums[i] {
            primes.push(i as u32);
        }
    }

    primes
}

fn main() {

    let mut s = String::new();
    std::io::stdin().read_line(&mut s).ok();

    let primes = sieve(s.trim().parse().unwrap());
    println!("{} {}", primes.len(), primes[primes.len() - 1]);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sieve_test_1() {
        assert_eq!(vec![2], sieve(2));
    }

    #[test]
    fn sieve_test_2() {
        assert_eq!(vec![2, 3], sieve(3));
    }

    #[test]
    fn sieve_test_3() {
        assert_eq!(vec![2, 3], sieve(4));
    }

    #[test]
    fn sieve_test_4() {
        assert_eq!(vec![2, 3, 5, 7, 11, 13, 17, 19, 23], sieve(25));
    }

    #[test]
    fn sieve_test_5() {
        assert_eq!(vec![2, 3, 5, 7, 11, 13, 17, 19, 23], sieve(23));
    }

    #[test]
    fn sieve_test_6() {
        assert_eq!(vec![2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67,
                        71, 73, 79, 83, 89, 97],
                   sieve(100));
    }

    #[test]
    fn sieve_test_7() {
        assert_eq!(78498, sieve(1000000).len());
    }
}
