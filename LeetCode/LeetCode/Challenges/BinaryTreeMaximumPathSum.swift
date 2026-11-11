// Created 11/11/2026.

import Foundation

//https://leetcode.com/problems/binary-tree-maximum-path-sum/
struct BinaryTreeMaximumPathSum {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h)
    //binary tree
    //DFS
    //recursive
    //inout
    //Kadanes algorithm
    //
    //Solution Description:
    //For any given node (treated as the root of its own subtree) there are four path sums it has access to:
    //
    //1. Left branch + root + right branch (`both`).
    //2. Left branch + root (`leftCurrent`).
    //3. Right branch + root (`rightCurrent`).
    //4. Root on its own (`node.val`).
    //
    //To calculate the branch sums before the root, we traverse the tree in post-order DFS. As this tree can contain
    //negative values, it is not a given which of these sums is the largest, so we compare all four against `maxSum` -
    //replacing it if required. While a path can contain both branches, it can only do so at its root. So we can't
    //simply pass back the largest of those four sums; instead we need to choose from 2, 3 or 4 - this is because once
    //this frame unwinds, the current root will just be part of a branch of the next root. Importantly, by including
    //`node.val` on its own in the value to be returned, we allow negative subtrees to be dropped, i.e. a branch doesn't
    //need to include all nodes down to a leaf node. Once all nodes have been explored, we return `maxSum`.
    //
    //Similar to: https://leetcode.com/problems/diameter-of-binary-tree/
    //Similar to: https://leetcode.com/problems/maximum-subarray/
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        _ = dfs(root, &maxSum)

        return maxSum
    }

    private func dfs(_ node: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let node else {
            return 0
        }

        let leftSum = dfs(node.left, &maxSum)
        let rightSum = dfs(node.right, &maxSum)

        let both = leftSum + rightSum + node.val
        let leftCurrent = leftSum + node.val
        let rightCurrent = rightSum + node.val

        maxSum = max(maxSum, both, leftCurrent, rightCurrent, node.val)

        return max(leftCurrent, rightCurrent, node.val)
    }
}
