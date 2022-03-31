//
//  ProductOfArrayExceptSelf.swift
//  LeetCode
//
//  Created by William Boles on 31/03/2022.
//

import Foundation

//https://leetcode.com/problems/product-of-array-except-self/
//array
struct ProductOfArrayExceptSelf {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //reversing
    //
    //Solution Description:
    //We make three passes of `nums`. The first pass sets the product of `i` to be the product of `0..<i` (notice how we only
    //use `nums[i]` after we assign `left` to `i`). The second pass goes from `n...0` and sets the product of `(i + 1)...`
    //(notice again how we only use `nums[i]` after we assign `right` to `i`). The third combines the two previous passes
    //this way we end up with a result that for each element contains `0..<i` * `(i + 1)...`
    static func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftProducts = Array(repeating: 1, count: nums.count)
        var left = 1
        for i in 0..<nums.count{
            leftProducts[i] = left
            left = nums[i] * left //we only apply `nums[i]` after we assign `left` to `i` that way we exclude `nums[i]`
        }
        
        var rightProducts = Array(repeating: 1, count: nums.count)
        var right = 1
        for i in (0..<nums.count).reversed(){
            rightProducts[i] = right
            right = nums[i] * right //we only apply `nums[i]` after we assign `right` to `i` that way we exclude `nums[i]`
        }
        
        var result = [Int]()
        for i in 0..<nums.count {
            let product = leftProducts[i] * rightProducts[i]
            result.append(product)
        }
        
        return result
    }
    
    //Time: O(n)
    //Space: O(1)
    //
    //Solution Description:
    //If we have the total value of `nums` then to exclude any value will be as if we took that total and divided it by the
    //value. What makes this trickier is that `nums` can contain zeros. If `nums` contains one zero then the only element in
    //the `result` array that won't be zero is that zero element. If `nums` contains multuple zeros then all elements in
    //`result` will be zero
    static func productExceptSelfDividing(_ nums: [Int]) -> [Int] {
        var zeroCount = 0
        var total = 1
        var nonZeroTotal = 1
        
        for num in nums {
            total *= num
            
            if num != 0 {
                nonZeroTotal *= num
            } else {
                zeroCount += 1
            }
        }
        
        var result = Array(repeating: 0, count: nums.count)
        
        guard zeroCount < 2 else {
            return result
        }
        
        for i in 0..<nums.count {
            let num = nums[i]
            if zeroCount == 0 {
                result[i] = total / num
            } else if num == 0 {
                result[i] = nonZeroTotal
            }
        }
        
        return result
    }
}
