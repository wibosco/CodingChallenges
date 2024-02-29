//
//  FirstBadVersion.swift
//  LeetCode
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/first-bad-version/
struct FirstBadVersion {
    let badVersion: Int
    
    // MARK: - BadVersion
    
    private func isBadVersion(_ version: Int) -> Bool {
        version >= badVersion
    }
    
    //Time: O(log n)
    //Space: O(1)
    //binary search find leftmost
    //divide and conquer
    //
    //Solution Description:
    //By treating `versions` as a sorted array containing `true` and `false` values we are able to perform a binary search
    //over `versions` to find the first bad version
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if isBadVersion(mid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
