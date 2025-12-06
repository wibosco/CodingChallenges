// Created 31/03/2023.

import Foundation

//https://leetcode.com/problems/missing-number/
struct MissingNumber {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //maths
    //
    //Solution Description:
    //As `nums` contains only numbers within the range `0...nums.count` we determine what the sum of that range is and then
    //subtract the sum of the actual values in `nums` to give us the missing number.
    //
    //N.B. As `nums` contains only positive incrementing values we can determine the sum of those values times the count by
    //the count + 1 and then dividing that value by 2.
    func missingNumber(_ nums: [Int]) -> Int {
        let sumOfRange = (nums.count * (nums.count + 1)) / 2
        let sumOfValues = nums.reduce(0, +)
        
        return sumOfRange - sumOfValues
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //set
    //
    //Solution Description:
    //As `nums` contains only numbers within the range `0...nums.count` we build a set `range` that contains all the possible
    //valid values. As we iterate through `nums` we remove each element from `range` that we encounter. We return the only
    //element in range that remains as the missing number.
    func missingNumberSet(_ nums: [Int]) -> Int {
        var range = Set<Int>(0...nums.count)
        
        for num in nums {
            range.remove(num)
        }
        
        return range.removeFirst()
    }
}
