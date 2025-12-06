// Created 07/12/2023.

import Foundation

//https://leetcode.com/problems/maximum-average-subtree/
struct MaximumAverageSubtree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse to the left nodes in the tree and as the recursive stack unwinds we calculate the sum and average
    //for that node. At each level we take the left and right child sums and counts and combine them with the current node to
    //calculate that subtrees average - this average is then compared against `maxAverage` and `maxAverage` is updated if
    //necessary. When then pass the `count` and `sum` up the next level to repeat this process. Once all averages have been
    //calculcate we return `maxAverage`.
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        var maxAverage = 0.0
        
        _ = dfs(root, &maxAverage)
        
        return maxAverage
    }
    
    private func dfs(_ node: TreeNode?, _ maxAverage: inout Double) -> (Int, Int) { //count, sum
        guard let node = node else {
            return (0, 0) //basecase
        }
        
        let (leftCount, leftSum) = dfs(node.left, &maxAverage)
        let (rightCount, rightSum) = dfs(node.right, &maxAverage)
        
        let sum = node.val + leftSum + rightSum
        let count = leftCount + rightCount + 1 //+1 for current node
        
        let average: Double = Double(sum) / Double(count)
        maxAverage = max(maxAverage, average)
        
        return (count, sum)
    }
}
