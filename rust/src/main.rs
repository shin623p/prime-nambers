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
