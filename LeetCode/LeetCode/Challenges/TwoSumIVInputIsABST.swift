// Created 10/11/2023.

import Foundation

//https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
struct TwoSumIVInputIsABST {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //inout
    //set
    //inverted thinking
    //
    //Solution Description:
    //Using DFS and a visited set we traverse the tree and at each node attempt to see if we have already seen the delta of 
    //that current nodes value and `k` by checking if that delta value is in `visited`. If the delta is in `visited`, we
    //immediately return true,; if delta isn't in `visited` we add the current nodes value to `visited` and continue the
    //search. Particular care must be taken where the current nodes value and delta are the same as we can't reuse a node.
    //As `visited` is an inout set, values found in one branch of the search are available to other branches.
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var visited = Set<Int>()
        return dfs(root, k, &visited)
    }
    
    private func dfs(_ node: TreeNode?, _ target: Int, _ visited: inout Set<Int>) -> Bool {
        guard let node = node else {
            return false
        }
        
        let delta = target - node.val
        
        guard !visited.contains(delta) else {
            return true
        }
        //insert needs to come after check to cover the case where delta == node.val
        visited.insert(node.val)
        
        return dfs(node.left, target, &visited) || dfs(node.right, target, &visited)
    }
}
