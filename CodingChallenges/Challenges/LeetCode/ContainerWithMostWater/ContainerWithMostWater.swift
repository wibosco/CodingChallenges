//
//  ContainerWithMostWater.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/container-with-most-water/
struct ContainerWithMostWater {
    
    //O(n)
    static func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        
        var left = 0
        var right = height.count - 1
        
        while right > left {
            let leftHeight = height[left]
            let rightHeight = height[right]
            
            let heightOfContainer = min(leftHeight, rightHeight)
            let distance = right - left

            maxArea = max(maxArea, (heightOfContainer * distance))
            
            if leftHeight > rightHeight {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return maxArea
    }
    
    //O(n^2)
    static func maxAreaBruteForce(_ height: [Int]) -> Int {
        var maxArea = 0
        
        for i in 0..<height.count {
            for j in (i+1)..<height.count {
                let heightOfContainer = min(height[i], height[j])
                let distance = j - i
                
                maxArea = max(maxArea, (heightOfContainer * distance))
            }
        }
        
        return maxArea
    }
}
