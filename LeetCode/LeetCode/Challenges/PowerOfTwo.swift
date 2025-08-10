// Created 10/08/2025.

import Foundation

//https://leetcode.com/problems/power-of-two/
struct PowerOfTwo {
    
    //Time: O(log n) where n is `n`
    //Space: O(1)
    //maths
    //modulo
    //looping
    //
    //Solution Description:
    //A number that is a power of 2 will be even when divided by 2 all the way down to 1 - we can use this property to loop
    //through gradually smaller versions of `n` until we either get to 1 or the number is odd.
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }

        var n = n
        while n > 1 {
            guard n % 2 == 0 else {
                return false
            }
            
            n /= 2
        }

        return true
    }
    
    //Time: O(1) as we loop a maximum of 31 iterations
    //Space: O(1)
    //maths
    //
    //Solution Description:
    //Loop through the possible values and compare against `n`.
    func isPowerOfTwo2(_ n: Int) -> Bool {
        for i in 0...31 {
            if Double(n) == pow(2.0, Double(i)) {
                return true
            }
        }

        return false
    }
}
