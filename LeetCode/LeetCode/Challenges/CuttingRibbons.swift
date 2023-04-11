//
//  CuttingRibbons.swift
//  LeetCode
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/cutting-ribbons/
//binary search
struct CuttingRibbons {
    
    //Time: O(log n) `n` is the number of elements in `ribbons`
    //Space: O(1)
    //array
    //maximum
    //divide and conquer
    //
    //Solution Description:
    //The minimum length a ribbbon can be 1 and the maximum length is the maximum length in `ribbbons`. We can treat this
    //min..max range as a sorted list of possible lengths. Performing a binary search on this range we can find that
    //maximum length while discarding half of the possible lengths at each step. If the total ribbon for a given length is
    //equal or greater than `k` then we know that we are potentally cutting the ribbons too short and need to increase the
    //length of each cut i.e. the left edge needs to move right; if the total ribbons are less than `k` then we know that we
    //are cutting each ribbon too long and need to shorten the cut i.e. the right edge needs to move left. Once the right
    //edge is smaller or equal than the left edge, then we should have found the maximum length (if it exists) and can
    //return `right` as that value.
    //
    //NB: we don't need to use each ribbon so our max length (right boundary) should be the maxmimum length not the minimum length
    //
    //Similar to: https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
    static func maxLength(_ ribbons: [Int], _ k: Int) -> Int {
        var left = 1
        var right = ribbons[0]
        
        for ribbon in ribbons[1...] {
            right = max(right, ribbon)
        }
    
        while left <= right {
            let mid = left + (right - left) / 2
            
            var totalRibbons = 0
            for ribbon in ribbons {
                totalRibbons += (ribbon / mid)
            }
            
            //we want the max length for a cut so even `k` cuts may be too small if multiple values can produce `k` cuts
            if totalRibbons >= k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
}
