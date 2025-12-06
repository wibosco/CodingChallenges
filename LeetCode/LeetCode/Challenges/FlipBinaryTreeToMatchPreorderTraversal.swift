// Created 18/11/2023.

import Foundation

//https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal/
struct FlipBinaryTreeToMatchPreorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using DFS we check the tree to determine if a pre-order traversal matches `voyage` - pre-order being current->left->right.
    //If we encounter a mismatch between the tree and `voyage` we record the mismatch in `changes` and flip the node the sibling
    //nodes, before continuing the check with the new structure. We prevent unlimited flips of the same level by nesting the
    //flipped call - this means we don't need to pass a "canFlip" parameter into `dfs`. We repeat this process until we either
    //get another mismatch after having already flipped or we visit all nodes in the tree.
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        guard let root = root else {
            return [-1]
        }
        
        var changes = [Int]()
        var index = 0
        
        if !dfs(root, voyage, &index, &changes) {
            return [-1]
        }
        
        return changes
    }
    
    private func dfs(_ node: TreeNode?, _ voyage: [Int], _ index: inout Int, _ changes: inout [Int]) -> Bool {
        guard let node = node else {
            return true
        }
        
        guard node.val == voyage[index] else {
            return false
        }
    
        index += 1

        //in pre-order traversal we fully search the left nodes before the right nodes
        if !(dfs(node.left, voyage, &index, &changes) && dfs(node.right, voyage, &index, &changes)) {
            //mismatch
            changes.append(node.val)
            
            //no need to actually flip the nodes instead we search right node first which has the same affect
            return dfs(node.right, voyage, &index, &changes) && dfs(node.left, voyage, &index, &changes)
        }
        
        return true
    }
}
