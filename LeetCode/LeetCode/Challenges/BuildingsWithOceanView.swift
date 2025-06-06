//
//  BuildingsWithOceanView.swift
//  LeetCode
//
//  Created by William Boles on 12/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/buildings-with-an-ocean-view/
struct BuildingsWithOceanView {
    
    //Time: O(n) where n is the number of heights
    //Space: O(n) where n is the number of heights
    //array
    //
    //Solution Description:
    //Coming from right to left (ocean inwards) we track the tallest building that have so far, if a building is taller than it
    //then it has an ocean view if not then it doesn't.
    func findBuildings(_ heights: [Int]) -> [Int] {
        var currentTallest = heights.last!
        var oceanViews = [(heights.count - 1)]
        
        for (i, height) in heights[0..<(heights.count - 1)].enumerated().reversed() {
            if height > currentTallest {
                oceanViews.append(i)
                currentTallest = height
            }
        }
        
        return oceanViews.reversed()
    }
    
    //Time: O(n) where n is the number of heights
    //Space: O(n) where n is the number of heights
    //array
    //stack
    //monotonic stack
    //
    //Solution Description:
    //Coming from right to left (ocean inwards) we track the building we have seen so far in a monotonic decreasing stack i.e.
    //the last element is the smallest. As we encounter each new building we compare them against the last building in the
    //stack. If the new building is taller than the last building in the stack, we pop the stack and compare the new last
    //building - if we get to the end of the stack then we know that the current building has an ocean; else we know that a
    //taller building is nearer the ocean so no view.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing when it
    //follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    func findBuildingsStack(_ heights: [Int]) -> [Int] {
        var stack = [Int]()
        var oceanViews = [Int]()

        for (i, height) in heights.enumerated().reversed() {
            while !stack.isEmpty {
                //If the building to the right is smaller, we can pop it.
                guard heights[stack.last!] < height else {
                    break
                }

                stack.removeLast()
            }

            //If the stack is empty, it means there is no building to the right that can block the view of the current building.
            if stack.isEmpty {
                oceanViews.append(i)
            }

            stack.append(i)
        }
        
        return oceanViews.reversed()
    }
}
