// Created 20/01/2022.

import Foundation

//https://leetcode.com/problems/ugly-number/
struct UglyNumber {
    
    //Time: O(
    //Space: O(1)
    //prime numbers
    //modulo
    //
    //Solution Description:
    //Determine if `n` can cleanly be divided by each ugly prime, if it can divide it until it can't; if it can't
    //move onto the next prime. Once all the primes have been processed, check if `n` has been reduced to 1
    func isUgly(_ n: Int) -> Bool {
        guard n != 0 else {
            return false
        }
        
        var n = n
        let primes = [2, 3, 5] //the ugly primes
        
        for prime in primes {
            while n % prime == 0 { //check if n can be be reduced cleanly by the prime
                n /= prime
            }
        }
        
        return n == 1
    }
}
