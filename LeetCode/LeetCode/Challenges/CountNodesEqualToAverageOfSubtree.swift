// Created 10/11/2023.

import Foundation

//https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/
struct CountNodesEqualToAverageOfSubtree {
    
    //Time: O(n) where n is the number of nodes in the tree.
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Using DFS we perform a traversal that is very similar to a post-order traversal but with the twist that as we unwind the call
    //stack we pass back up with sum of that subtree and the count of the nodes that make up that subtree. We then add the current
    //node to that sum and count and check if once the average is calculated that nodes value matches the average - if it does we
    //increment `matchCount`. We repeat this process until all nodes have been checked.
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var matchCount = 0
        _ = dfs(root, &matchCount)
        
        return matchCount
    }
    
    private func dfs(_ node: TreeNode?, _ matchCount: inout Int) -> (Int, Int) { //sum, count
        guard let node = node else {
            return (0, 0)
        }
        
        let leftValues = dfs(node.left, &matchCount)
        let rightValues = dfs(node.right, &matchCount)
        
        let sum = leftValues.0 + rightValues.0 + node.val
        let count = leftValues.1 + rightValues.1 + 1
        let average = sum / count
        
        if node.val == average {
            matchCount += 1
        }
        
        return (sum, count)
    }
    
    //Time: O(n) where n is the number of nodes in the tree.
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we perform a traversal that is very similar to a post-order traversal but with the twist that as we unwind the call
    //stack we pass back up with sum of that subtree, the count of the nodes that make up that subtree and the count of how many
    //nodes have a value that is equal to it's trees average. We then add the current node to that sum and count and check if once
    //the average is calculated that nodes value matches the average - if it does we increment `matchCount`. We repeat this process
    //until all nodes have been checked and the recrusive stack full unwinds. At which point we can return the count.
    func averageOfSubtree2(_ root: TreeNode?) -> Int {
        let (_, _, count) = dfs2(root)

        return count
    }

    private func dfs2(_ node: TreeNode?) -> (Int, Int, Int) { //(total, nodes, count)
        guard let node else {
            return (0, 0, 0)
        }

        let (leftTotal, leftNodeCount, leftMatchCount) = dfs2(node.left)
        let (rightTotal, rightNodeCount, rightMatchCount) = dfs2(node.right)

        let nodeCount = (leftNodeCount + rightNodeCount + 1)
        let total = (leftTotal + rightTotal + node.val)
        let average = total / nodeCount
        let matchCount = leftMatchCount + rightMatchCount + (average == node.val ? 1 : 0)

        return (total, nodeCount, matchCount)
    }
}
