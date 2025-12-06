// Created 31/03/2023.

import Foundation

//https://leetcode.com/problems/single-number
struct SingleNumber {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //bit manipulation
    //bitwise
    //
    //Solution Description:
    //Iterating through `nums` we combine the current element using XOR to find the unpair element - treating each number as its
    //binary representation. This works because the paired elements will cancel each other out so as `result` is XOR'd with the
    //current num the binary bits that match between `num` and `result` are set to 0 and those that don't are set to 1 so with
    //each iteration we gradually get "nearer" to that unpaired value.
    //
    //N.B. In an XOR operation the order isn't important - https://en.wikipedia.org/wiki/XOR_gate
    //
    //N.B. https://www.youtube.com/watch?v=qMPX1AOa83k
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0 // n ^ 0 = n so 0 is a safe first value
        
        for num in nums {
            result ^= num //XOR
        }
        
        return result
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //set
    //
    //Solution Description:
    //Using a set (for O(1) search time) to store `nums` elements that we have already seen, we loop through `nums` and check
    //if that element is already in `singles`. If it is we know it can't be the single and can remove it from the `singles`; if
    //it is not then we add it to `singles` and continue looping
    func singleNumberSet(_ nums: [Int]) -> Int {
        var singles = Set<Int>()
        
        for num in nums {
            guard !singles.contains(num) else {
                singles.remove(num)
                continue
            }
            
            singles.insert(num)
        }
        
        return singles.removeFirst()
    }
}
