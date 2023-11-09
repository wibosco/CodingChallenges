//
//  SuccessfulPairsOfSpellsAndPotions.swift
//  LeetCode
//
//  Created by William Boles on 01/08/2023.
//

import Foundation

//https://leetcode.com/problems/successful-pairs-of-spells-and-potions/
struct SuccessfulPairsOfSpellsAndPotions {
    
    //Time: O(n log n + m log n) where n is the number of elements in `spells`
    //                           where m is the number of elements in `potions`
    //Space: O(m) don't count the output array
    //array
    //sorting
    //binary search
    //
    //Solution Description:
    //By first sorting `potions` we can iterate through `spells` and perform binary search to find the earliest/smallest `potion`
    //and `spell` combination that equals or exceeds `success`. It's important to reiterate that we are not looking any combination
    //but rather the earliest/smallest combination so rather than stopping at a find, we continue until we find that
    //earliest/smallest element. With that element and a sorted `potions`, we know that all subsequent elements will also equal or
    //exceed `success` so we can calculate the remaining elements and add that our `pairs` array. Where no elements equal or exceed
    //`success` we add `0`.
    static func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let potions = potions.sorted()
        
        var pairs = [Int]()
        
        for spell in spells {
            var left = 0
            var right = potions.count - 1
            
            while left <= right {
                let mid = left + (right - left) / 2 //to avoid overflow
                
                if (potions[mid] * spell) >= success {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            
            let count = potions.count - left
            pairs.append(count)
        }
        
        return pairs
    }
    
    //Time: O(n log n + (n * m)) where n is the number of elements in `spells`
    //                           where m is the number of elements in `potions`
    //Space: O(m) don't count the output array
    //array
    //sorting
    //
    //Solution Description:
    //By first sorting `potions` we can iterate through `spells` and once we have found one `potion` and `spell` combination that
    //equals or exceeds `success` then we know that all subsequent elements in `potions` will also equal or exceed `success` so we
    //can calculate the remaining elements and add that our `pairs` array. Where no elements equal or exceed `success` we add `0`.
    static func successfulPairsLooping(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let potions = potions.sorted()
        
        var pairs = [Int]()
        
        for spell in spells {
            var count = 0
            for (i, potion) in potions.enumerated() {
                if (potion * spell) >= success {
                    count = potions.count - i
                    break
                }
            }
            
            pairs.append(count)
        }
        
        return pairs
    }
}
