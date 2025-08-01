//
//  NestedListWeightSum.swift
//  LeetCode
//
//  Created by William Boles on 30/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/nested-list-weight-sum/
struct NestedListWeightSum {
    
    //Time: O(n) where n is the number of `NestedInteger` elements
    //Space: O(n) where n is the recursive stack
    //graph theory
    //DFS
    //recursive
    //
    //Solution Description:
    //Treat `nestedList` as a graph. Using DFS traverse through the `nestedList`, at each level checking if we have an integer
    //or list. If we have an integer we multiple it against the depth and add it to the total; if we have a list we go deeper.
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        return dfs(nestedList, 0) //on the leetcode website this 0 for depth needs to be 1 to pass - strange
    }

    private func dfs(_ nestedList: [NestedInteger], _ depth: Int) -> Int {
        var result = 0

        for nestedInteger in nestedList {
            if nestedInteger.isInteger() {
                result += (nestedInteger.getInteger() * depth)
            } else {
                result += dfs(nestedInteger.getList(), (depth + 1))
            }
        }

        return result
    }
    
    //Time: O(n) where n is the number of `NestedInteger` elements
    //Space: O(n) where n is the recursive stack
    //graph theory
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Treat `nestedList` as a graph. Using DFS traverse through the `nestedList`, at each level checking if we have an integer
    //or list. If we have an integer we multiple it against the depth and add it to the total; if we have a list we go deeper.
    func depthSum2(_ nestedList: [NestedInteger]) -> Int {
        var total = 0
        dfs2(nestedList, 0, &total) //on the leetcode website this 0 for depth needs to be 1 to pass - strange
        
        return total
    }
    
    private func dfs2(_ nestedList: [NestedInteger], _ depth: Int, _ total: inout Int) {
        guard !nestedList.isEmpty else {
            return
        }
        
        for nestedInteger in nestedList {
            if nestedInteger.isInteger() {
                let value = nestedInteger.getInteger()
                total += (value * depth)
            } else {
                let list = nestedInteger.getList()
                dfs2(list, (depth + 1), &total)
            }
        }
    }
    
    //Time: O(n) where n is the number of `NestedInteger` elements
    //Space: O(n)
    //graph theory
    //BFS
    //iterative
    //
    //Solution Description:
    //Treat `nestedList` as a graph. Using BFS traverse through the `nestedList`, at each level checking if we have an integer or
    //list. If we have an integer we multiple it against the depth and add it to the total; if we have a list we add it's elements
    //to the queue.
    func depthSum3(_ nestedList: [NestedInteger]) -> Int {
        var total = 0
        var queue = [NestedInteger]()
        
        for ni in nestedList {
            queue.append(ni)
        }
        
        var depth = 0 //on the leetcode website this 0 for depth needs to be 1 to pass - strange
        
        while !queue.isEmpty {
            var newQueueItems = [NestedInteger]()
            
            for nestedInteger in queue {
                if nestedInteger.isInteger() {
                    let value = nestedInteger.getInteger()
                    total += value * depth
                } else {
                    let list = nestedInteger.getList()
                    for ni in list {
                        newQueueItems.append(ni)
                    }
                }
            }
            
            queue = newQueueItems
            
            depth += 1
        }
        
        return total
    }
}
