// Created 06/04/2023.

import Foundation

//https://leetcode.com/problems/power-of-three
struct PowerOfThree {
    
    //Time: O(log n)
    //Space: O(log n)
    //maths
    //recursive
    //modulo
    //
    //Solution Description:
    //W attempt to divide `n` by 3 recursively until we get 1. We check that our division is "clean" by ensuring none of the divisions
    //will result in a remainder.
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }

        guard n > 1 else {
            return true
        }

        guard n % 3 == 0 else {
            return false
        }
        
        return isPowerOfThree((n/3))
    }
}
