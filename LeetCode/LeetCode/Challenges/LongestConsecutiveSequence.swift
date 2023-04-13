//
//  LongestConsecutiveSequence.swift
//  LeetCode
//
//  Created by William Boles on 10/04/2023.
//

import Foundation

//https://leetcode.com/problems/longest-consecutive-sequence/
//array
struct LongestConsecutiveSequence {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //set
    //
    //Solution Description:
    //Rather than sorting `nums` which would be a O(n log n) operation we can instead iterate twice through `nums` to determine the longest
    //sequence. On the first iteration we build up the `elements` set which will allows us to check if a `nums` element has a pre or post
    //sequence value in `nums` in O(1) time. In the next iteration of `nums`, we first check if `num - 1` exists in `elements` - the start
    //of a sequence is the left/lowest value in that sequence. If `num - 1` exists then we know that we don't have the start of a sequence
    //and that a longer sequence could be formed so we move to the next element in `nums`; if `num - 1` doesn't not exist we have found
    //the start of a sequence now need to find the end, as we are looking for a consecutive sequence we know the next value needs to be
    //`num + 1` so we search for that value and so on until we reach the end. Once the lenght of a sequence is found we compare it against
    //`longest` and take the higher value. With all elements check we return `longest`.
    static func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        let elements = Set<Int>(nums)
        
        var longest = 0
        
        for num in nums {
            guard !elements.contains((num - 1)) else {
                continue
            }
            
            var sequenceNum = (num + 1)
            var count = 1
            
            while elements.contains(sequenceNum) {
                count += 1
                sequenceNum += 1
            }
            
            longest = max(longest, count)
        }
        
        return longest
    }
}
