//
//  NestedListWeightSum.swift
//  LeetCode
//
//  Created by William Boles on 30/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/nested-list-weight-sum/
//graph theory
struct NestedListWeightSum {
    
    //Time: O(n) `n` is the number of `NestedInteger` elements
    //Space: O(n)
    //BFS
    //iterative
    //
    //Solution Description:
    //Treat `nestedList` as a graph. Using BFS traverse through the `nestedList`, at each level checking if we have an integer or
    //list. If we have an integer we multiple it against the depth and add it to the total; if we have a list we add it's elements
    //to the queue.
    static func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var total = 0
        var queue = [NestedInteger]()
        
        for ni in nestedList {
            queue.append(ni)
        }
        
        var depth = 0 //on the leetcode website this 0 for depth needs to be 1 to pass - strange
        
        while !queue.isEmpty {
            let count = queue.count
                        
            for _ in 0..<count {
                let nestedInteger = queue.removeFirst()
                if nestedInteger.isInteger() {
                    let value = nestedInteger.getInteger()
                    total += value * depth
                } else {
                    let list = nestedInteger.getList()
                    for ni in list {
                        queue.append(ni)
                    }
                }
            }
            
            depth += 1
        }
        
        return total
    }
    
    //Time: O(n) `n` is the number of `NestedInteger` elements
    //Space: O(n) `n` is the recursive stack
    //DFS
    //recursive
    //
    //Solution Description:
    //Treat `nestedList` as a graph. Using DFS traverse through the `nestedList`, at each level checking if we
    //have an integer or list. If we have an integer we multiple it against the depth and add it to the total;
    //if we have a list we go deeper.
    static func depthSumDFS(_ nestedList: [NestedInteger]) -> Int {
        var total = 0
        dfs(nestedList, 0, &total) //on the leetcode website this 0 for depth needs to be 1 to pass - strange
        
        return total
    }
    
    private static func dfs(_ nestedList: [NestedInteger], _ depth: Int, _ total: inout Int) {
        guard !nestedList.isEmpty else {
            return
        }
        
        for nestedInteger in nestedList {
            if nestedInteger.isInteger() {
                let value = nestedInteger.getInteger()
                total += (value * depth)
            } else {
                let list = nestedInteger.getList()
                dfs(list, (depth + 1), &total)
            }
        }
    }
}
