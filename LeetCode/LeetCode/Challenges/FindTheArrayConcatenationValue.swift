// Created 11/06/2024.

import Foundation

//https://leetcode.com/problems/find-the-array-concatenation-value/
struct FindTheArrayConcatenationValue {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //string
    //
    //Solution Description:
    //Using two pointers we work out->in. We take the int values at each pointer and concatenate them into a string and then
    //into a single int value which we then add to `result`. We repeat this process until `p1` crosses `p2`, if `p1` is equal
    //to `p2` then it means that `nums` has an odd number of elements and we take that final element and add it `result`.
    func findTheArrayConcVal(_ nums: [Int]) -> Int {
        var result = 0
        
        var p1 = 0
        var p2 = nums.count - 1
        
        while p1 < p2 {
            let strValue = "\(nums[p1])\(nums[p2])"
            let intValue = Int(strValue)!
            
            result += intValue
            
            p1 += 1
            p2 -= 1
        }
        
        if p1 == p2 {
            result += nums[p1]
        }
        
        return result
    }
}
