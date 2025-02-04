//
//  MostFrequentSubtreeSum.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2023.
//

import Foundation

//https://leetcode.com/problems/most-frequent-subtree-sum/
struct MostFrequentSubtreeSum {
 
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //post-order
    //bottom-up
    //inout
    //dictionary
    //
    //Solution Description:
    //Using a recursive bottom-up approach we first calculate the sum of the bottom-most subtrees and then combine these
    //subtree sums to calculate the higher sums. At each stage we store the sum we have calculated in the `sums`
    //dictionary alongside the count of how many times that sum has been produced. To simplify retrieval of the most
    //frequent sums we keep track of which count is the most seen. Once we have fully traversed the tree and produced all
    //sums we iterate through `sums` and add any sum that has a count of `maxCount` to `mostFrequentSums`.
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var maxCount = 0
        var sums = [Int: Int]() //[sum, count]
        
        _ = dfs(root, &sums, &maxCount)
        
        var mostFrequentSums = [Int]()
        
        for (sum, count) in sums {
            guard count == maxCount else {
                continue
            }
            
            mostFrequentSums.append(sum)
        }
        
        return mostFrequentSums
    }
    
    private func dfs(_ node: TreeNode?, _ sums: inout [Int: Int], _ maxCount: inout Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        let leftSum = dfs(node.left, &sums, &maxCount)
        let rightSum = dfs(node.right, &sums, &maxCount)
        
        let sum = leftSum + rightSum + node.val
        
        let count = (sums[sum] ?? 0) + 1
        
        maxCount = max(maxCount, count)
        sums[sum] = count
        
        return sum
    }
}
