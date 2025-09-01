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
    
    //Time: O(n) where n is the number of elements in `nestedList`
    //Space O(n)
    //graph theory
    //n-ary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Treat `nestedList` as a tree. Using DFS traverse through the `nestedList`, at each level checking if we have an
    //integer or list. If we have an integer we add it and the depth to the `values` array; if we have a list we go deeper.
    //We also track the max depth as we traverse. When our DFS traversal ends we calculate the sum and return it.
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
    
    //Time: O(n) where n is the number of elements in `nestedList`
    //Space O(n)
    //graph theory
    //n-ary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `nestedList` as a tree. We make two passes using DFS, the first pass calculates the max depth of the tree, the
    //second calculates the sum of the tree using the max depth. In the first DFS we are only interested in the depth for we
    //ignore the integer values. In the second DFS we use the integer value to gradually build up the sum. Once all ndoes have
    //been processed we return `sum`.
    func depthSumInverse2(_ nestedList: [NestedInteger]) -> Int {
        let md = maxDepth(nestedList, 1)

        return dfs(nestedList, 1, md)
    }

    private func dfs(_ list: [NestedInteger], _ depth: Int, _ maxDepth: Int) -> Int {
        var sum = 0
        for n in list {
            if n.isInteger() {
                let num = n.getInteger()
                sum += (num * ((maxDepth - depth) + 1))
            } else {
                sum += dfs(n.getList(), (depth + 1), maxDepth)
            }
        }

        return sum
    }

    private func maxDepth(_ list: [NestedInteger], _ depth: Int) -> Int {
        var md = depth
        for n in list {
            if !n.isInteger() {
                let d = maxDepth(n.getList(), (depth + 1))
                md = max(md, d)
            }
        }

        return md
    }
}
