//
//  DivideArrayInSetsOfKConsecutiveNumbers.swift
//  LeetCode
//
//  Created by William Boles on 04/07/2023.
//

import Foundation

//https://leetcode.com/problems/divide-array-in-sets-of-k-consecutive-numbers
//array
struct DivideArrayInSetsOfKConsecutiveNumbers {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //dictionary
    //frequency
    //greedy
    //sorting
    //modulo
    //
    //Solution Description:
    //In order to be able to divide `nums` into groups of `k` elements, `nums` needs to divide by `k` so the first check is a
    //modulo operation. If `nums` does not divide then we can return false; else we proceed. As `nums` can contain duplicate
    //elements we first convert it into a frequency dictionary which will allow O(1) retrieval time and also allow us to sort
    //`nums` in ascending order (with any duplicates). We then attempt to group `nums` elements into that are consecutive in
    //nature i.e. the next element is 1 value bigger. If at any point the next value isn't bigger we return false. If we run
    //out of unique `nums` elements before we build a group we return false. If having iterated through all elements we have
    //satisified all conditions we return true.
    static func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count % k == 0 else {
            return false
        }
        
        var numFrequency = [Int: Int]() //[num: count]
        
        for num in nums {
            numFrequency[num, default: 0] += 1
        }
        
        let numOfDivisions = nums.count / k
        let sortedNums = numFrequency.keys.sorted { $0 < $1}
        
        for _ in 0..<numOfDivisions {
            var remaining = k
            var lastNum: Int?
            
            //by using the unique keys we avoid having to check for and skip over duplicate elements
            for num in sortedNums where numFrequency[num] != 0 && remaining > 0 {
                if let lastNum = lastNum {
                    if num - lastNum != 1 {
                        return false
                    }
                }
                
                let count = numFrequency[num]!
                numFrequency[num] = count - 1
                remaining -= 1
                lastNum = num
            }
            
            if remaining > 0 {
                return false
            }
        }
        
        return true
    }
}
