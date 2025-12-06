// Created 13/11/2023.

import Foundation

//https://leetcode.com/problems/house-robber-iii/
struct HouseRobberIII {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //dynamic programming
    //bottom-up
    //
    //Solution Description:
    //Using DFS to traverse to the bottom of the tree we calculate two possible outcomes for each node - what is the value
    //returned if I rob this node and what is the value returned if I don't rob this node. As we unwind our recursive stack
    //we return those two outcomes for each node. It's important to note that this problem as the constraint of if I rob the
    //current node I can not rob the child node, so when we calculate the outcome for the robbing the current node we can
    //only do so using the "non-robbed" childs value however if we don't rob the current node we are free to choose to rob
    //the child node or not (it might be more valuable to skip multiple nodes). When eventually we get to the top of the
    //tree we return the maximum of either branch.
    func rob(_ root: TreeNode?) -> Int {
        let (left, right) = dfs(root)
        
        return max(left, right)
    }
    
    private func dfs(_ node: TreeNode?) -> (Int, Int) { //(withRobbingCurrentNode, withoutRobbingCurrentNode)
        guard let node = node else { //beyond leaf
            return (0, 0) //basecase
        }
        
        let left = dfs(node.left)
        let right = dfs(node.right)
        
        //can't rob the next node so can only take the withRobbingCurrentNode value
        let withRobbingCurrentNode = left.1 + right.1 + node.val
        //no restrictions on whether we can rob the next node so take the max
        let withoutRobbingCurrentNode = max(left.0, left.1) + max(right.0, right.1)
            
        return (withRobbingCurrentNode, withoutRobbingCurrentNode)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //dynamic programming
    //top-down
    //memoization
    //
    //Solution Description:
    //Using DFS to traverse the tree we determine the maximum value possible from any given node where that node has
    //either been robbed or not. As this process will involved multiple repeated steps we use memoization to store the
    //work of a completed step so as to avoid having the re-calculate it. As the recursive calls unwind we return the
    //maximum value of whether we should rob the current node or node until we arrive back at the root, at which point
    //we have the maximum and can return it.
    func robMemo(_ root: TreeNode?) -> Int {
        var memo = [Int: Int]()
        let max = dfsMemo(root, true, &memo)
        
        return max
    }
    
    private func dfsMemo(_ node: TreeNode?, _ canRob: Bool, _ memo: inout [Int: Int]) -> Int {
        guard let node = node else { //beyond leaf
            return 0 //basecase
        }
        
        let withoutRobbingCurrentNode: Int
        let skipKey = (ObjectIdentifier(node).hashValue) + 0 //0 for skipping
        if let cacheSkipped = memo[skipKey] {
            withoutRobbingCurrentNode = cacheSkipped
        } else {
            withoutRobbingCurrentNode = dfsMemo(node.left, true, &memo) + dfsMemo(node.right, true, &memo)
        }
        memo[skipKey] = withoutRobbingCurrentNode
        
        let withRobbingCurrentNode: Int
        if canRob {
            let robKey = (ObjectIdentifier(node).hashValue) + 1 //1 for robbing
            if let cacheRobbed = memo[robKey] {
                withRobbingCurrentNode = cacheRobbed
            } else {
                withRobbingCurrentNode = dfsMemo(node.left, false, &memo) + dfsMemo(node.right, false, &memo) + node.val
                memo[robKey] = withRobbingCurrentNode
            }
        } else {
            withRobbingCurrentNode = 0
        }
        
        return max(withRobbingCurrentNode, withoutRobbingCurrentNode)
    }
    
    //Time: O(2^n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS to traverse the tree we determine the maximum value possible from any given node where that node has
    //either been robbed or not. As the recursive calls unwind we return the maximum value of whether we should rob the
    //current node or node until we arrive back at the root. , at which point we have the maximum and can return it.
    func robNonDP(_ root: TreeNode?) -> Int {
        return dfsNonDP(root, true)
    }
    
    private func dfsNonDP(_ node: TreeNode?, _ canRob: Bool) -> Int {
        guard let node = node else {
            return 0
        }
        
        let withoutRobbingCurrentNode = dfsNonDP(node.left, true) + dfsNonDP(node.right, true)
        let withRobbingCurrentNode: Int
        if canRob {
            withRobbingCurrentNode = dfsNonDP(node.left, false) + dfsNonDP(node.right, false) + node.val
        } else {
            withRobbingCurrentNode = 0
        }
        
        return max(withRobbingCurrentNode, withoutRobbingCurrentNode)
    }
}
