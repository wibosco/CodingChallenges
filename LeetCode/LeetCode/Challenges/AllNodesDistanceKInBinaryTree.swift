// Created 11/07/2023.

import Foundation

//https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/
struct AllNodesDistanceKInBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //BFS
    //iterative
    //dictionary
    //visited
    //
    //Solution Description:
    //First we build a parent->child dictionary between the `root` and `target` nodes using DFS - this will allow us to traverse
    //both down and up the tree and find those nodes that are `k` distance away. First we traverse down the tree from the
    //`target` node using BFS and add any nodes at `k` away from `target` to the `values` array. Next using the `parents`
    //dictionary we move up a level and search downwards from there. Every time we move up we reduce the possible `k` downward
    //movements by 1. We need to be careful to avoid re-searching the branch we just came from so we use a blocker node to cut
    //that branch off - blocker acts like a single entry `visited` set. We repeat the upwards movement and then downwards
    //searching until `k` is 0.
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root, let target = target else {
            return []
        }
        
        var parents = [Int: TreeNode]()
        
        buildParentRelationships(root, target, &parents)
        
        var values = [Int]()
        
        bfs(target, target, k, &values)
        
        var child = target
        var remainingK = k
        
        while let parent = parents[child.val], remainingK > 0 {
            remainingK -= 1
            
            bfs(parent, child, remainingK, &values)
            
            child = parent
        }
        
        return values
    }
    
    private func buildParentRelationships(_ node: TreeNode, _ target: TreeNode, _ parents: inout [Int: TreeNode]) {
        guard node.val != target.val else {
            return
        }
        
        if let left = node.left {
            parents[left.val] = node
            buildParentRelationships(left, target, &parents)
        }
        
        if let right = node.right {
            parents[right.val] = node
            buildParentRelationships(right, target, &parents)
        }
    }
    
    private func bfs(_ node: TreeNode, _ blocker: TreeNode, _ k: Int, _ values: inout [Int]) {
        var queue = [node]
        var k = k
        
        while !queue.isEmpty && k >= 0 {
            var newQueue = [TreeNode]()
            
            for node in queue {
                guard k > 0 else {
                    values.append(node.val)
                    continue
                }
                
                if let left = node.left, left.val != blocker.val {
                    newQueue.append(left)
                }
                
                if let right = node.right, right.val != blocker.val {
                    newQueue.append(right)
                }
            }
            
            k -= 1
            queue = newQueue
        }
    }
}
