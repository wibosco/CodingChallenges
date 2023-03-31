//
//  KokoEatingBananas.swift
//  LeetCode
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/koko-eating-bananas/
//binary search
struct KokoEatingBananas {
    
    //Time: O(n log m) where `n` is number of elements in `piles` and `m` the search range
    //Space: O(1)
    //minimum
    //sorted
    //modulo
    //
    //Solution Description:
    //Koko can eat at a minimum 1 banana an hour and at a maximum Koko can one pile i.e. the largest pile. We can treat this
    //min..max range as a sorted list of possible bananas eaten per hour. Performing a binary search on this range will allow
    //us to find the minimum eating speed by dscarding half the speeds after each step until we run out of range. If the eating
    //speed is too small to eat all bananas in `h` time then we increase the speed by moving the left boundary right so to limit
    //our search range to faster speeds; if we are able to eat all bananas with `h` time then we know what going any quicker
    //will also result in all bananas so we can discard those speeds as we want the minimum eating speeed i.e move the right
    //boundary left so to limit our search range to slower speeds.
    static func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1 //slowest eating speed
        var right = 0 //find the largest single pile that she could eat in one hour
        
        for pile in piles {
            right = max(right, pile)
        }
        
        while left < right {
            let mid = left + (right - left) / 2
            
            var hoursEating = 0
            
            for pile in piles { //can only eat one pile a day regardless of eating capacity i.e. `mid` value
                var daysToEatPile = pile / mid
                if pile % mid != 0 { //left over bananas still need to eaten
                    daysToEatPile += 1
                }
                
                hoursEating += daysToEatPile
            }
            
            if hoursEating > h { //is koko eating too few bananas?
                left = mid + 1 //as we tested mid we know it's too slow so set left to be 1 greater than that speed
            } else {
                right = mid //we know that mid is fast enough to eat all bananas within the time but we want to min so set right to mid and search again
            }
        }
        
        return left
    }
}
