//
//  BinarySearch.swift
//  CodingChallenges
//
//  Created by William Boles on 16/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//binary search
//See: https://medium.com/swlh/binary-search-find-upper-and-lower-bound-3f07867d81fb
struct BinarySearch {
    //Time: O(log n)
    static func find(_ target: Int, in nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
}
