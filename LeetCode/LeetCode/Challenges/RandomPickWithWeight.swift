//
//  RandomPickWithWeight.swift
//  LeetCode
//
//  Created by William Boles on 03/03/2022.
//

import Foundation

//https://leetcode.com/problems/random-pick-with-weight/

//array
//prefix sum
//sorted
//binary search
//
//Solution Description:
//To transform `w` into a weighted array we use a prefixSum array to handle the range of possible values that would give you
//that give you a proportional chance of "landing" on that index randomly e.g. for `[1, 3, 5, 7, 9]` you effectively have
//`[1, 3, 3, 3, 5, 5, 5, 5, 5, 7, 7, 7, 7, 7, 7, 7, 9, 9, 9, 9, 9, 9, 9, 9, 9]`. Rather than constructing an array like the
//example above(which potentially might be very expensive space-wise) we can instead work with ranges. In order to get these
//ranges we build an array containing prefix sum values, with the value being the upper bounds for that range. As `w` can
//only contain positive values, `prefixSums` will end up being sorted in ascending order. We can use `prefixSums` nature to
//perform a binary search to find the random value - `target`.
struct RandomPickWithWeight {
    private let prefixSums: [Int]
    private let total: Int
    
    //Time: O(n) where n is the number of elements in `w`
    init(_ w: [Int]) {
        var prefixSum = 0
        var prefixSums = [Int]()
        
        for i in 0..<w.count {
            prefixSum += w[i]
            prefixSums.append(prefixSum)
        }
        
        self.prefixSums = prefixSums
        self.total = prefixSum
    }
    
    //Time: O(log n) where n is the number of elements in `prefixSums`
    func pickIndex() -> Int {
        let target = Int.random(in: 0..<total)
        
        var left = 0
        var right = prefixSums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if prefixSums[mid] > target {
                //note that `prefixSums[mid]` will be giving us the upper bounds for index `mid` so when adjusting the boundaries
                //we can't exclude `mid` as it is possible the target is between `prefixSums[(mid - 1)]` and `prefixSums[mid]`
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}

//array
//prefix sum
//sorted
//
//Solution Description:
//To transform `w` into a weighted array we use a prefixSum array to handle the range of possible values that would give you
//that give you a proportional chance of "landing" on that index randomly e.g. for `[1, 3, 5, 7, 9]` you effectively have
//`[1, 3, 3, 3, 5, 5, 5, 5, 5, 7, 7, 7, 7, 7, 7, 7, 9, 9, 9, 9, 9, 9, 9, 9, 9]`. Rather than constructing an array like the
//example above(which potentially might be very expensive space-wise) we can instead work with ranges. In order to get these
//ranges we build an array containing prefix sum values, with the value being the upper bounds for that range. Once we have
//our random value we can then iterate through `prefixSums` and determine if the random value would land in that range. As
//`prefixSums` is a sorted array (in ascending order) we have treat the previous iterates upper bounds as this iterations
//lower bounds so in order to get to iteration `i`, the random value must be larger than all previous iterations.
struct RandomPickWithWeightLinear {
    private let prefixSums: [Int]
    private let total: Int
    
    //Time: O(n) where n is the number of elements in `w`
    init(_ w: [Int]) {
        var prefixSum = 0
        var prefixSums = [Int]()
        
        for i in 0..<w.count {
            prefixSum += w[i]
            prefixSums.append(prefixSum)
        }
        
        self.prefixSums = prefixSums
        self.total = prefixSum
    }
    
    //Time: O(n) where n is the number of elements in `prefixSums` (which is the same as `w`)
    func pickIndex() -> Int {
        let target = Int.random(in: 0..<total)
        
        for (i, prefixSum) in prefixSums.enumerated() {
            //no need do a "between" check as prefixSums is a sorted array so if we got here the previous `i` was too small
            if target < prefixSum {
                return i
            }
        }
        
        return -1
    }
}
