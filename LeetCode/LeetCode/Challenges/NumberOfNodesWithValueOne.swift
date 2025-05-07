// Created 07/05/2025.

import Foundation

//https://leetcode.com/problems/number-of-nodes-with-value-one/
struct NumberOfNodesWithValueOne {
    
    //Time: O(q * n) where q is the number of queries
    //               where n is the number of nodes in the tree
    //Space: O(q + n)
    //binary tree
    //array
    //DFS
    //recursive
    //multi-source
    //
    //Solution Description:
    //Two flips to the same subtree will cancel each other out so first we compact the queries to be performed by cancelling
    //any pairs out. Then treating the `values` array as a binary tree we perform a DFS to flip the value of each node for
    //each query. An an array we can determine which index will is a child index from the parent index with the following
    //calculation:
    //
    //left-child: (parent * 2) + 1
    //right-child: (parent * 2) + 2
    //
    //With this equation we can move through the full subtree flipping. To avoid having to count `1` nodes once all flips
    //have been performed we track the `1` nodes by incrementing or decrementing `total` as required. Once all flips have
    //been completed we return `total`.
    //
    //Similar to: https://leetcode.com/problems/make-costs-of-paths-equal-in-a-binary-tree/
    func numberOfNodes(_ n: Int, _ queries: [Int]) -> Int {
        var compactedQueries = Set<Int>() //order of flips isn't important
        for query in queries {
            if compactedQueries.contains(query) {
                //fliping and flipping back again will cancel out the change so we can remove the
                //first flip altogether
                compactedQueries.remove(query)
            } else {
                compactedQueries.insert(query)
            }
        }
        
        var total = 0
        var values = Array(repeating: false, count: n)
        
        for query in compactedQueries {
            dfs(&values, (query - 1), &total) //-1 to adjust to zero indexed array
        }
        
        return total
    }
    
    private func dfs(_ values: inout [Bool], _ index: Int, _ total: inout Int) {
        guard index < values.count else {
            return
        }
        
        values[index] = !values[index]
        
        if values[index] {
            total += 1
        } else {
            total -= 1
        }
        
        dfs(&values, ((index * 2) + 1), &total) //left-child
        dfs(&values, ((index * 2) + 2), &total) //right-child
    }
}
