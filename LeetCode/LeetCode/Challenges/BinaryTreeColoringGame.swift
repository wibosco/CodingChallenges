//
//  BinaryTreeColoringGame.swift
//  LeetCode
//
//  Created by William Boles on 13/12/2023.
//

import Foundation

//https://leetcode.com/problems/binary-tree-coloring-game/
struct BinaryTreeColoringGame {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //greedy
    //
    //Solution Description:
    //In order to maximise the nodes that blue can capture we need to choose nodes that are neighbors of red i.e. parent, left
    //or right child, so as to limit the possible nodes that red can capture. First we use DFS to find the node `x` is in the
    //tree. Then using DFS again we calculate how many nodes are the left branch with `xNode` as the root (ignoring the right
    //branch), the right branch with `xNode` as the root (ignoring the left branch) and the total nodes in a subtree rooted
    //at `xNode`. With this information and `n` we can simualate that would happen if blue started as the parent node of red,
    //left child node and right child node (without having to actually walk the tree for those scenarios). If any of those
    //possible starting positions for blue resulted in blue ending up with more nodes than red we return true else we return
    //false.
    func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
        let xNode = find(root, x)
        
        let leftBranchCount = count(xNode?.left)
        let rightBranchCount = count(xNode?.right)
        let subtreeCount = leftBranchCount + rightBranchCount + 1 //+1 for xNode
        
        let blueChoosesParentOfRed = (n - subtreeCount) > subtreeCount
        let blueChoosesLeftChildOfRed = leftBranchCount > (n - leftBranchCount)
        let blueChoosesRightChildOfRed = rightBranchCount > (n - rightBranchCount)
        
        return blueChoosesParentOfRed || blueChoosesLeftChildOfRed || blueChoosesRightChildOfRed
    }
    
    private func find(_ node: TreeNode?, _ target: Int) -> TreeNode? {
        guard let node = node else {
            return nil
        }
        
        guard node.val != target else {
            return node
        }

        if let leftResult = find(node.left, target) {
            return leftResult
        } else {
            return find(node.right, target)
        }
    }
    
    private func count(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        return count(node.left) + count(node.right) + 1 //+1 for current node
    }
}
