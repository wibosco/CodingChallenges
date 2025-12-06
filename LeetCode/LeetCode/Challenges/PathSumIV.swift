// Created 22/11/2023.

import Foundation

//https://leetcode.com/problems/path-sum-iv/
struct PathSumIV {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n + h) where n is the number of elements in `nums`
    //                where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //inout
    //top-down
    //
    //Solution Description:
    //First we convert `nums` into a levels and index dictionary to allow for easier retrieval. Then we perform a DFS of each
    //branch in the tree using `levels`. As we traverse we build up a `sum` of each node for each branch once we reach a leaf
    //node we add that paths sum to `total`. Once all paths have been visited we return `total`.
    func pathSum(_ nums: [Int]) -> Int {
        var levels = [Int: [Int: Int]]()
        for num in nums {
            let level = (num / 100) - 1
            let index = ((num % 100) / 10) - 1 //-1 to transform into zero index
            let value = (num % 100) % 10
            
            var values = levels[level, default: [Int: Int]()]
            values[index] = value
            levels[level] = values
        }
        
        var total = 0
        
        dfs(levels, 0, 0, 0, &total)
        
        return total
    }
    
    private func dfs(_ levels: [Int: [Int: Int]], _ level: Int, _ index: Int, _ sum: Int, _ total: inout Int) {
        guard let value = levels[level]?[index] else {
            return
        }
        
        let nextSum = sum + value
        let nextLevel = level + 1
        
        let leftChildIndex = index * 2
        let rightChildIndex = (index * 2) + 1
        
        let leftChildExists = levels[nextLevel]?[leftChildIndex] != nil
        let rightChildExists = levels[nextLevel]?[rightChildIndex] != nil
        
        if !leftChildExists && !rightChildExists {
            //reached leaf node
            total += nextSum
        } else {
            dfs(levels, nextLevel, leftChildIndex, nextSum, &total)
            dfs(levels, nextLevel, rightChildIndex, nextSum, &total)
        }
    }
}
