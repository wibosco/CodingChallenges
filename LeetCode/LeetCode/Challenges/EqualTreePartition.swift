// Created 22/11/2023.

import Foundation

//https://leetcode.com/problems/equal-tree-partition/
struct EqualTreePartition {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where he is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //top-down
    //
    //Solution Description:
    //Using bottom-up DFS we produce a sum tree where every node holds the sum of it's subtree. We then perform a top-down DFS to
    //determine if removing a edge will result in the two trees having the same value. We recusively attempt this with all nodes
    //in the tree until we find a spliting that results in equal trees. 
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        let total = buildSumTree(root)
        
        return canEqualise(root.left, total) || canEqualise(root.right, total)
    }
    
    private func buildSumTree(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        let leftValue = buildSumTree(node.left)
        let rightValue = buildSumTree(node.right)
        
        node.val = leftValue + rightValue + node.val
            
        return node.val
    }
    
    private func canEqualise(_ node: TreeNode?, _ total: Int) -> Bool {
        guard let node = node else {
            return false
        }
        
        if total - node.val == node.val { //would removing this edge make the trees equal?
            return true
        }
        
        return canEqualise(node.left, total) || canEqualise(node.right, total)
    }
}
