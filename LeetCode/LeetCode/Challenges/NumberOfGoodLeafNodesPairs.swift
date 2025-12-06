// Created 16/11/2023.

import Foundation

//https://leetcode.com/problems/number-of-good-leaf-nodes-pairs/
struct NumberOfGoodLeafNodesPairs {
    
    //Time: O(n * l^2) where n is the number of nodes in the tree
    //                 where l is the number of leaf nodes
    //Space: O(h + l) where h is the height of the tree
    //                where l is the number of nodes in the tree
    //binary tree
    //DFS
    //recursive
    //array
    //inout
    //bottom-up
    //
    //Solution Description:
    //In order to find the shortest distance between two leaf nodes we need to find the lowest common ancestor between those nodes. We
    //can use a bottom-up DFS to traverse the leaf nodes in the tree and then as the callstack unwinds, leaf nodes will both unwind at
    //the same time to the same ancestor node allow us to calculate the distance between them. To avoid having to re-traverse from that
    //ancestor node we can have each leaf node return the depth it is at, we can then combine these depths to get the distance between
    //them and compare that difference to `distance` to determine if those nodes are "good". After we compare all leaf nodes we combine
    //the two depth arrays to pass further up the callstack - this way we don't double count leaf nodes.
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        var count = 0
        _ = dfs(root, distance, 0, &count)
        
        return count
    }
    
    private func dfs(_ node: TreeNode?, _ distance: Int, _ depth: Int, _ count: inout Int) -> [Int] {
        guard let node = node else {
            return [Int]()
        }
        
        if node.left == nil && node.right == nil {
            return [depth]
        }
        
        let leftLeafDepths = dfs(node.left, distance, (depth + 1), &count)
        let rightLeafDepths = dfs(node.right, distance, (depth + 1), &count)
            
        for leftLeafDepth in leftLeafDepths {
            for rightLeafDepth in rightLeafDepths {
                let distanceBetweenLeaves = (leftLeafDepth - depth) + (rightLeafDepth - depth)
                if distanceBetweenLeaves <= distance {
                    count += 1
                }
            }
        }
        
        return leftLeafDepths + rightLeafDepths
    }
}
