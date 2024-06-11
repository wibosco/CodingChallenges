//
//  FindAllK-DistantIndicesInAnArray.swift
//  LeetCode
//
//  Created by William Boles on 11/06/2024.
//

import Foundation

//https://leetcode.com/problems/find-all-k-distant-indices-in-an-array/
struct FindAllKDistantIndicesInAnArray {
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //nested loops
    //two pointers
    //
    //Solution Description:
    //First we iterate through `nums` to find all the indexes where the value at that index is equal to `key`. Then we 
    //iterate through `nums` again and for each index we attempt to satisfy `|i - j| <= k` where `j` is an index where
    //the value of that index is equal to `k` - if this can be satisfied we add `i` to the `result` array and increment
    //`i`. We repeat this process until all elements have been checked and then we return `result`.
    func findKDistantIndices(_ nums: [Int], _ key: Int, _ k: Int) -> [Int] {
        var result = [Int]()
        var keyIndexes = [Int]()
        
        for (index, num) in nums.enumerated() {
            if num == key {
                keyIndexes.append(index)
            }
        }
        
        for i in 0..<nums.count {
            for j in keyIndexes {
                if abs((i - j)) <= k {
                    result.append(i)
                    
                    break
                }
            }
        }
        
        return result
    }
}
