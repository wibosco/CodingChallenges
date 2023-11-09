//
//  ContainerWithMostWater.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/container-with-most-water/
struct ContainerWithMostWater {
    
    //Time: O(n)
    //Space: O(1)
    //greedy
    //two pointers
    //
    //Solution Description:
    //Treating the size of each element in `height` as the vertical edge (height) of a rectangle and the distance between two
    //elements as the horizontal edge (width) we can calculate the area of water each configuration can contains. Using two
    //pointers we move through the array and calculate the area at between the two pointers - we choose the smaller of the two
    //heights to use in the area calculation. This area is then compared against the largest area we have seen so far and if
    //larger it replaces it, else we move on. When deciding which pointer to move for the next area calculation we do so in a
    //greedy manner by only moving the smaller pointer.
    static func maxArea(_ height: [Int]) -> Int {
        var maxContainerArea = 0
        
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let h1 = height[left]
            let h2 = height[right]
            
            let h = min(h1, h2)
            let l = right - left
            
            let containerArea = h * l //area = height * length
            maxContainerArea = max(maxContainerArea, containerArea)
            
            if h1 > h2 {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return maxContainerArea
    }
    
    //Time: O(n^2)
    //Space: O(1)
    static func maxAreaBruteForce(_ height: [Int]) -> Int {
        var maxContainerArea = 0
        
        for i in 0..<height.count {
            for j in (i+1)..<height.count {
                let heightOfContainer = min(height[i], height[j])
                let distance = j - i
                
                maxContainerArea = max(maxContainerArea, (heightOfContainer * distance))
            }
        }
        
        return maxContainerArea
    }
}
