//
//  MaximumProductSubarray.swift
//  LeetCode
//
//  Created by William Boles on 24/04/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-product-subarray/
struct MaximumProductSubarray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //As `nums` can contain negative numbers we need to track not just the maximum product but also the minimum product as
    //the product of two negatives is a positive. Iterating through `nums` we calculate the maximum and minimum product up
    //to that element. As `nums` can contain zeros, we know that for any given element, that element on it's own might be
    //the maximum or minimum product so when calculating those values, our `max` and `min` operations are over three
    //values. We then compare `currentMaxProduct` against the overall `maxProduct` and take the largest.
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = nums[0]
        var currentMaxProduct = nums[0]
        var currentMinProduct = nums[0]
        
        for num in nums[1...] {
            let oldMaxProduct = currentMaxProduct
            
            //note that we multiple against both `currentMaxProduct` and `currentMinProduct`
            currentMaxProduct = max(num, (num * currentMaxProduct), (num * currentMinProduct))
            currentMinProduct = min(num, (num * oldMaxProduct), (num * currentMinProduct))
            
            maxProduct = max(maxProduct, currentMaxProduct)
        }
        
        return maxProduct
    }
}
