//
//  FindDistanceInABinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 07/12/2023.
//

import Foundation

//https://leetcode.com/problems/find-distance-in-a-binary-tree/
struct FindDistanceInABinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we find the path to `p` and `q`. Once we have both paths we attempt to find the lowest-common-ancestor
    //between `p` and `q`. There are two possible scenarios for `p` and `q`:
    //
    //1. they are on the same branch
    //2. they share a root
    //
    //In scenario 1, `p` or `q` will appear in the others path so we first find which node is deeper and then taking the
    //shallower node, we check if that node is in the deeper path - if it is found, we return the delta of the length of
    //both paths; if it isn't found then we know that `p` and `q` are not on the same branch.
    //
    //In scenario 2, `p` and `q` share a root, so we need to traverse up the tree until both paths end up on the same node.
    //As `p` and `q` can be at different depths, we set the depths to be equal to the shallowest depth of either `p` or `q`
    //as this is the "nearest" node that can possibly be the lowest-common-ancestor between those nodes. Once we get a
    //match return the sum of the length of both paths from that matching node.
    //
    //N.B. `pPath` and `qPath` contain nodes so to each the edges we need to subtract 1.
    //
    //Similar to: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
    static func findDistance(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
        let pPath = find(root, p, 0, [])
        let qPath = find(root, q, 0, [])
        
        let minDepth = min(pPath.count, qPath.count) - 1
        
        //p and q on same branch
        if pPath.count > qPath.count {
            if qPath[minDepth] == p {
                return (pPath.count - 1) - (qPath.count - 1) //-1 as we want to return the edges between p and q
            }
        } else {
            if pPath[minDepth] == q {
                return (qPath.count - 1) - (pPath.count - 1) //-1 as we want to return the edges between p and q
            }
        }
        
        var i = minDepth
        
        while i >= 0 {
            if pPath[i] == qPath[i] {
                return ((pPath.count - 1) - i) + ((qPath.count - 1) - i) //-1 as we want to return the edges between p and q
            }
            
            i -= 1
        }
        
        return -1
    }
    
    private static func find(_ node: TreeNode?, _ target: Int, _ depth: Int, _ path: [Int]) -> [Int] {
        guard let node = node else {
            return []
        }
        
        var path = path
        path.append(node.val)
        
        if node.val == target {
            return path
        }
        
        var depth = depth
        depth += 1
        
        let left = find(node.left, target, depth, path)
        let right = find(node.right, target, depth, path)
        
        return left.isEmpty ? right : left
    }
}
