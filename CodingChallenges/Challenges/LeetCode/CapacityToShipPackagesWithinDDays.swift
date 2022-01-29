//
//  CapacityToShipPackagesWithinDDays.swift
//  CodingChallenges
//
//  Created by William Boles on 14/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
//binary search
struct CapacityToShipPackagesWithinDDays {
    
    //O(n log m) where `n` is number of elements in `weights` and `m` the search range
    //Space: O(1)
    //sorted
    //minimum
    //divide and conquer
    //
    //Solution Description:
    //In order for a any ship to ship `weights`, it needs to at a minimum be able to ship the largest weight in `weights` and
    //at a maximum be able to handle the sum of `weights`. We can treat this min..max range as a sorted list of possible ship
    //weights - now we just have to figure out which ship weight in this range will result in the `weights` being delivered
    //in `days` days. Performing a binary search on this range we can find that minimum weight while discarding half of the
    //possible weights at each step. If the delivery takes greater than the required days then we know we have choosen too
    //small a weight for the ships i.e. the left edge needs to move right; if the delivery can happen within the days
    //using the current weight we need to ensure that that weight is the minimum so we have to shrink the wieght i.e. the
    //right edge need to move left.
    static func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var left = 0 // minimum weight which has to be the largest in `weights`
        var right = 0 //maximum weight which is the sum of all elements in `weights`
        
        for weight in weights {
            left = max(left, weight)
            right += weight
        }
        
        while left < right {
            let mid = left + (right - left) / 2
            var currentDailyCargoWeight = 0
            var daysNeeded = 1
            
            for weight in weights { //start filling the ship
                if (currentDailyCargoWeight + weight) > mid {
                    daysNeeded += 1
                    currentDailyCargoWeight = 0
                }
                currentDailyCargoWeight += weight
            }
            
            if daysNeeded > days { //too many days required at this ship weight
                left = mid + 1 //mid is too small, lets increase it
            } else {
                right = mid // can carry the weight in the days but could the ship be smaller?
            }
        }
        
        return left
    }
}
