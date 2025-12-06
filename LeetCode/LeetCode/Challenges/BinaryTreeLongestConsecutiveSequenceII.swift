// Created 21/11/2023.

import Foundation

//https://leetcode.com/problems/binary-tree-longest-consecutive-sequence-ii/
struct BinaryTreeLongestConsecutiveSequenceII {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //inout
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes and gradually build up our path values as the recursive stack unwinds. In order
    //for two nodes to form a consecutive sequence they need to have an absolute difference of 1 - so either the order of the
    //nodes can be either ascending or descending. To avoid having to continuously work out if our path is ascending or
    //descending at each possible candidate node we return two values - the ascending count and the descending count. One of
    //both of these values will be zero. We compare the current node with it's immediate child nodes to determine if either
    //can be used to form a sequence, if they can we update the relevent ascending or descending count by adding 1 (being the
    //current node) to it. As we potentally have two child nodes and both can fulfil the ascending or descending criteria we
    //choose the larger of the two paths for both ascending and descending to pass further up the stack. Note that the path
    //don't need to come from the same child node. There is a special case where the current node can join the two paths into
    //either into a sequence - here we add `ascending` and `descending` and 1 together - note this combined value can not be
    //passed up as we want a path not a subtree. We repeat this process until we are back the root.
    func longestConsecutive(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var maxCount = 1
        
        _ = dfs(root, &maxCount)
        
        return maxCount
    }
    
    private func dfs(_ node: TreeNode?, _ maxCount: inout Int) -> ((Int, Int)) { //ascendingCount, descendingCount
        guard let node = node else {
            return ((0, 0))
        }
        
        //view ascending and descending from the bottom-up
        var ascending = 0
        var descending = 0
        
        if let left = node.left {
            let (ascendingCount, descendingCount) = dfs(node.left, &maxCount)
            
            if node.val == left.val - 1 {
                ascending = ascendingCount + 1
            } else if node.val == left.val + 1 {
                descending = descendingCount + 1
            }
        }
        
        if let right = node.right {
            let (ascendingCount, descendingCount) = dfs(node.right, &maxCount)
            
            //for ascending and descending we only care about the largest branch/path to pass up
            if node.val == right.val - 1 {
                ascending = max(ascending, ascendingCount + 1)
            } else if node.val == right.val + 1 {
                descending = max(descending, descendingCount + 1)
            }
        }
        
        //this max operation will either operate on a path i.e. descending + current node or ascending + current because one
        //of descending or ascending will be 0 or it will operate on a subtree where both descending and ascending are non
        //zero
        maxCount = max(maxCount, (descending + ascending + 1)) //+1 for current node
        
        return (ascending, descending)
    }
}
