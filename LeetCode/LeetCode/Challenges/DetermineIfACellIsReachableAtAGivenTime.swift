//
//  DetermineIfACellIsReachableAtAGivenTime.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2023.
//

import Foundation

//https://leetcode.com/problems/determine-if-a-cell-is-reachable-at-a-given-time/
struct DetermineIfACellIsReachableAtAGivenTime {
    
    //Time: O(1)
    //Space: O(1)
    //maths
    //
    //Solution Description:
    //Rather than thinking about this problem as a graph, we can think of it purely as a maths problem. Each possible move
    //we could make uses 1 unit of `t`, so if we have more `t` than the distance from `(sx, sy)` to `(fx, fy)` then we can
    //get from `(sx, sy)` to `(fx, fy)` and so can return true; if the distance from `(sx, sy)` to `(fx, fy)` is greater
    //than `t` then it isn't possible to get from `(sx, sy)` to `(fx, fy)` and so can return false.
    //
    //N.B. this form of distance is calculate using the `Chebyshev distance` formula
    //https://en.wikipedia.org/wiki/Chebyshev_distance
    //https://chris3606.github.io/GoRogue/articles/grid_components/measuring-distance.html
    static func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        let width = abs(sx - fx)
        let height = abs(sy - fy)
        
        if width == 0 && height == 0 && t == 1 { //start and finish are the same sqaure
            return false
        }
        
        return t >= max(width, height)
    }
    
    //Time: O(8^t)
    //Space: O(8^t)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //
    //Solution Description:
    //Using DFS we attempt to traverse all adjacent cells/elements from `(sx, sy)` to `(fx, fy)`, as we need to use the full 
    //allocated of `t` moves we don't use a `visited` set so that we can use the same cell/element multiple times. As we don't
    //have a grid, we are not bounded and so don't need to check our relative indexing is inside that grid.
    //
    //N.B. we have used a relative `(sx, sy)` and `(fx, fy)` i.e. set `(sx, sy)` to `(0, 0)` and adjust `(fx, fy)` according,
    //to help reduce the number of branches by enclosing those points in a grid however the improvemets are small compared to
    //the complexity added.
    //
    //N.B. this solution does not scale well.
    static func isReachableAtTimeDFS(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        //up down left right up-diagonal-left up-diagonal-right down-diagonal-left down-diagonal-right
        let relativeIndexes = [[-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [-1, 1], [1, -1], [1, 1]]
        
        return dfs(sx, sy, fx, fy, t, relativeIndexes)
    }
    
    private static func dfs(_ x: Int, _ y: Int, _ fx: Int, _ fy: Int, _ timeRemaining: Int, _ relativeIndexes: [[Int]]) -> Bool {
        guard timeRemaining > 0 else {
            return x == fx && y == fy
        }
        
        for relativeIndex in relativeIndexes {
            let nextX = x + relativeIndex[0]
            let nextY = y + relativeIndex[1]
            
            if dfs(nextX, nextY, fx, fy, (timeRemaining - 1), relativeIndexes) {
                return true
            }
        }
        
        return false
    }
}
