//
//  ClimbingStairs.swift
//  LeetCode
//
//  Created by William Boles on 21/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/climbing-stairs/
struct ClimbingStairs {
    
    //Time: O(n)
    //Space: O(n)
    //binary tree
    //memoization
    //top-down
    //dynamic programming
    //recursive
    //DFS
    //
    //Solution Description:
    //Treating climbing stairs as a tree e.g.
    //
    //                0
    //       1                 2
    //   1      2          1       2
    // 1   2  1   2      1   2   1   2
    //
    //You end up with the same paths in different order e.g. `1 -> 2 -> 1` and `2 -> 1 -> 1`. At the end of both these paths
    //you have a total of 4, subsequently all paths from this 4 will result in the same outcome regardless if we got to 4 via
    //`1 -> 2 -> 1` or `2 -> 1 -> 1` (or any other path). With this in mind we only need to go down the `4` path once and then
    //any other path that leads to `4` can reuse that work - shortcutting to the answer and reducing the number of recursive
    //calls. To do this we need to use memoization to store the total number of successful paths from `4` - `memo`. As each
    //path returns we eventually get back to 0 which holds the number of valid climbs.
    //
    //N.B. this is a twist on https://leetcode.com/problems/fibonacci-number/
    //Similar to: https://leetcode.com/problems/decode-ways/
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func climbStairs(_ n: Int) -> Int {
        var memo = [Int: Int]()
        let ways = climbStairs(n, 0, &memo)
        return ways
    }
    
    private func climbStairs(_ targetTotal: Int, _ climbTotal: Int, _ memo: inout [Int: Int]) -> Int {
        guard climbTotal != targetTotal else {
            return 1 // another step
        }
        
        guard climbTotal < targetTotal else {
            return 0 //too many steps
        }
        
        //check if we have already went down the `climbTotal` branch and can just return the result of the previous effort
        guard memo[climbTotal] == nil else {
            return memo[climbTotal]!// 0 means that no paths from here result in climbTotal == n
        }
        
        memo[climbTotal] = climbStairs(targetTotal, (climbTotal + 1), &memo) + climbStairs(targetTotal, (climbTotal + 2), &memo)
        
        return memo[climbTotal]!
    }
    
    //Time: O(2^n)
    //Space: O(n) depth of the tree
    //binary tree
    //recursive
    //
    //Solution Description:
    //Recursively go down each possible combination of `1` and `2` until we either get to the target or exceed it. Paths that
    //lead to the target are returned with 1 or those that don't are returned with 0. We add this numbers together to get
    //the total valid paths
    func climbStairsBrute(_ n: Int) -> Int {
        return climbStairs(n, 0)
    }
    
    private func climbStairs(_ targetTotal: Int, _ climbTotal: Int) -> Int {
        guard climbTotal != targetTotal else {
            return 1 // valid climb
        }
        
        guard climbTotal < targetTotal else {
            return 0 //invalid climb
        }
        
        return climbStairs(targetTotal, (climbTotal + 1)) + climbStairs(targetTotal, (climbTotal + 2)) // go deeper
    }
    
    //Time: O(2^n)
    //Space: O(n) depth of the tree
    //binary tree
    //recursive
    //set
    //
    //Solution Description:
    //Recursively go down each possible combination of `1` and `2` until we either get to the target or exceed it. Paths that
    //lead to the target are added to the `ways` set, those that are discarded. Once all possible paths are exhausted we
    //return the count of `ways`
    func climbStairsSet(_ n: Int) -> Int {
        var ways = Set<[Int]>()
        climbStairs(n, [], 0, &ways)
        
        return ways.count
    }
    
    private func climbStairs(_ targetTotal: Int, _ climb: [Int], _ climbTotal: Int, _ ways: inout Set<[Int]>) {
        guard climbTotal != targetTotal else {
            ways.insert(climb)
            return
        }
        
        guard climbTotal < targetTotal else { //exceeded
            return
        }
        
        climbStairs(targetTotal, climb + [1], climbTotal + 1, &ways)
        climbStairs(targetTotal, climb + [2], climbTotal + 2, &ways)
    }
}
