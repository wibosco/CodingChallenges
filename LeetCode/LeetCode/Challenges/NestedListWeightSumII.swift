//
//  NestedListWeightSumII.swift
//  LeetCode
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/nested-list-weight-sum-ii/
struct NestedListWeightSumII {
    
    //Time: O(n)
    //Space O(n)
    //graph theory
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Treat `nestedList` as a graph. Using DFS traverse through the `nestedList`, at each level checking if we
    //have an integer or list. If we have an integer we add it and the depth to the `values` array; if we have
    //a list we go deeper. We also track the max depth as we traverse. When our DFS traversal ends we calculate
    //the sum and return it
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var values = [(integer: Int, depth: Int)]()
        var maxDepth = 1
        
        dfs(nestedList, 1, &maxDepth, &values)
        
        var result = 0
        for value in values {
            let weight = (maxDepth - value.depth + 1)
            result += (value.integer * weight)
        }
        
        return result
    }
    
    private func dfs(_ nestedList: [NestedInteger], _ depth: Int, _ maxDepth: inout Int, _ values: inout [(integer: Int, depth: Int)]) {
        guard !nestedList.isEmpty else {
            return
        }
        
        maxDepth = max(maxDepth, depth)
        
        for nestedInteger in nestedList {
            if nestedInteger.isInteger() {
                let integer = nestedInteger.getInteger()
                values.append((integer: integer, depth: depth))
            } else {
                let list = nestedInteger.getList()
                dfs(list, (depth + 1), &maxDepth, &values)
            }
        }
    }
}
