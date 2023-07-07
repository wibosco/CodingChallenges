//
//  CanPlaceFlowers.swift
//  LeetCode
//
//  Created by William Boles on 18/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/can-place-flowers/
//array
struct CanPlaceFlowers {
    
    //Time: O(n) where n is the number of elements in flowerbed
    //Space: O(1)
    //greedy
    //
    //Solution Description:
    //Iterate through the array. For every emput plot we check the previous index (where possible) and the next index (where
    //possible) to see if we can plant on this plot. If possible we plant and increment `placed` by one. At the end of the
    //loop we check if we planted at least `n` flowers
    static func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var placed = 0
        
        for (index, plot) in flowerbed.enumerated() {
            guard plot != 1 else {
                continue
            }
            
            let previousIndex = index - 1
            if previousIndex >= 0 {
                guard flowerbed[previousIndex] == 0 else {
                    continue
                }
            }
            
            let nextIndex = index + 1
            if nextIndex < flowerbed.count {
                guard flowerbed[nextIndex] == 0 else {
                    continue
                }
            }
            
            flowerbed[index] = 1
            placed += 1
        }
        
        return placed >= n
    }
}
