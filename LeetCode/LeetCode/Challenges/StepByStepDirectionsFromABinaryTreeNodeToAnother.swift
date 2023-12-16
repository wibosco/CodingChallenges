//
//  StepByStepDirectionsFromABinaryTreeNodeToAnother.swift
//  LeetCode
//
//  Created by William Boles on 13/12/2023.
//

import Foundation

//https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/
struct StepByStepDirectionsFromABinaryTreeNodeToAnother {
    
    //Time: O(
    //Space: O(
    //binary tree
    //DFS
    //recursive
    //array
    //inout
    //top-down
    //
    //Solution Description:
    //Using DFS we search for the path from root to either `startValue` or `destValue`. We then compare these paths to determine
    //which node is the lowest-common-ancestor of both `startValue` and `destValue` as passing through this `lca will result in
    //the shortest path. Think of it like finding the smallest subtree that contains both `startValue` and `destValue` We don't
    //need to compare the actual node values here just the direction changes, this is because we know that both searches start
    //at the same node (`root`). In order to find the `lca` we iterate through both `sPath` and `dPath` and compare the elements
    //at that index in both arrays - if the elements match we continue iterating; if the elements don't match we know that the
    //previous node (`i`) was the `lca`. To get from `startValue` to the `lca` we always need to travel upwards so we prefix our
    //`directions` array with `U`s by taking the count of the number of nodes after `lca` to get to `startValue` - this also
    //handles the case where `lca` is `startValue`. Next we do something similar with the `lca` to `destValue` path expect this
    //time we add those directions unchanged to `directions`. Once we have done this we have our path from `startValue` to
    //`destValue` and can return `directions`.
    //
    //Similar to: https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        guard let root = root else {
            return ""
        }
        
        var sPath = [String]()
        var dPath = [String]()
        
        _ = dfs(root, startValue, "", &sPath)
        _ = dfs(root, destValue, "", &dPath)
        
        var i = 0

        //find lowest-common-ancestor
        while i < sPath.count, i < dPath.count {
            if sPath[i] != dPath[i] {
                break
            }
            
            i += 1
        }
            
        //to get from `s` to lca we always need to go up (unless `s` is lca) so replace all directions
        //before lca with `U` and then add the part after `lca` of `dPath`
        let upMovesCount = sPath.count - i
        var directions = Array(repeating: "U", count: upMovesCount)
        directions.append(contentsOf: dPath[i...])
        
        return directions.joined()
    }
    
    private func dfs(_ node: TreeNode?, _ target: Int, _ direction: String, _ path: inout [String]) -> Bool {
        guard let node = node else {
            return false
        }
        
        path.append(direction)
        
        guard node.val != target else {
            return true
        }
        
        let found = dfs(node.left, target, "L", &path) || dfs(node.right, target, "R", &path)
        
        if !found {
            path.removeLast()
        }
        
        return found
    }
}
