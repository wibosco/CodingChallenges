//
//  ContainsDuplicateII.swift
//  LeetCode
//
//  Created by William Boles on 31/03/2022.
//

import Foundation

//https://leetcode.com/problems/contains-duplicate-ii/
//array
struct ContainsDuplicateII {
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(n)
    //dictionary
    //sliding window
    //sorted
    //
    //Solution Description:
    //Using a dictionary we are able to store the index of each element in `nums` so that as we iterate through `nums` we will
    //know in O(1) time if that element has occurred before and be able to compare if the absolute difference between the
    //current elements index and the previous elements index is less than or equal to `k`. As the indexes are an ascending,
    //sorted array i.e. 0 -> 1 -> 2 -> ...., if a calculation between two indexes doesn't result in a value less than or equal
    //to `k` then we don't need to keep the smaller of the two indexes and no subsquenet calculation using that index will
    //result in a value less than or equal to `k` as the other index will only be larger than the current index so whenever a
    //calculation fails we replace the previous index with the current index for that element on `nums` in the `map` dictionary.
    static func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if let j = map[num] {
                if abs(i - j) <= k {
                    return true
                }
            }
            
            map[num] = i //replace previous index for `num` with current index as previous index is too small
        }
        
        return false
    }
}
