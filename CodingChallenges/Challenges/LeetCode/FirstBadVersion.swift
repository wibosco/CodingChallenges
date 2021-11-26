//
//  FirstBadVersion.swift
//  CodingChallenges
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/first-bad-version/
//binary search
struct FirstBadVersion {
    
    let badVersion: Int
    
    // MARK: - Init
    
    init(badVersion: Int) {
        self.badVersion = badVersion
    }
    
    // MARK: - BadVersion
    
    private func isBadVersion(_ version: Int) -> Bool {
        version >= badVersion
    }
    
    //Time: O(log n)
    //Space: O(1)
    //
    //Solution Description:
    //1. Treating `versions` as an array containing `true` and `false` values
    //2. Binary search over `versions`
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
