//
//  FruitIntoBaskets.swift
//  LeetCode
//
//  Created by William Boles on 25/07/2023.
//

import Foundation

//https://leetcode.com/problems/fruit-into-baskets/
struct FruitIntoBaskets {
    
    //Time: O(n) where n is the number of elements in `fruits`
    //Space: O(1)
    //array
    //sliding window
    //dictionary
    //
    //Solution Description:
    //Using a frequency dictionary and a sliding window we iterate rightwards through `fruits` ensuring the window has at most 2
    //different fruit types. If the window contains more than 2 different fruit types we remove the left most element from the
    //frequency dictionary and recheck for 2 different fruit types - we repeat this step until the window contains at most 2
    //different fruit types. With every iteration we calculate the the maximum window size that we have seen so far and store it
    //in `maxFruits`. Once iterating through all elements in `fruits`, we return `maxFruits`.
    //
    //Similar to: https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
    func totalFruit(_ fruits: [Int]) -> Int {
        var maxFruits = 0
        
        var left = 0
        
        var fruitPicked = [Int: Int]()
        
        for (right, rightMostFruit) in fruits.enumerated() {
            fruitPicked[rightMostFruit, default: 0] += 1
            
            while fruitPicked.count > 2 { //move right until we are back to only 2 fruits picked
                let leftMostFruit = fruits[left]
                let leftMostFruitCount = fruitPicked[leftMostFruit]!
                
                if leftMostFruitCount == 1 { //about to be removed
                    fruitPicked.removeValue(forKey: leftMostFruit)
                } else {
                    fruitPicked[leftMostFruit] = leftMostFruitCount - 1
                }
                
                left += 1
            }
            
            maxFruits = max(maxFruits, ((right - left) + 1))
        }
        
        return maxFruits
    }
}
