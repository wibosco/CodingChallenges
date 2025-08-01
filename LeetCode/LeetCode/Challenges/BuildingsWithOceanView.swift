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
        var highest = 0
        var result = [Int]()

        for i in (0..<heights.count).reversed() {
            if heights[i] > highest {
                result.append(i)
                highest = heights[i]
            }
        }

        return result.reversed()
    }
    
    //Time: O(n) where n is the number of heights
    //Space: O(n) where n is the number of heights
    //array
    //stack
    //monotonic stack
    //
    //Solution Description:
    //We iterate from left to right through `heights` and track the building we have seen so far in a monotonic decreasing
    //stack i.e. the last element is the smallest. As we encounter each new building we compare them against the last
    //building in the stack. If the new building is taller than the last building in the stack, we pop the stack and repeat
    //the process with the new last until we encounter a building that is taller or the stack is empty. When then add the
    //new building to the stack and move onto the next building.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing when
    //it follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    func findBuildings2(_ heights: [Int]) -> [Int] {
        var stack = [Int]()

        for (i, height) in heights.enumerated() {
            while let last = stack.last, heights[last] <= height {
                stack.removeLast()
            }
            stack.append(i)
        }

        return stack
    }
}
