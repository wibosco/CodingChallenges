//
//  DiameterOfNAryTree.swift
//  LeetCode
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/diameter-of-n-ary-tree/
//graph theory
struct DiameterOfNAryTree { //DiameterOfN-AryTree
    
    //Time: O(n log n) where n is the number of nodes in the tree
    //Space: O(c) where `c` is the number of nodes at any level
    //DFS
    //
    //Solution Description:
    //Remembering that a tree is made up of smaller trees we use DFS to traverse to the end of each branch of those trees.
    //We are only interested in the two deepest branches in each subtree. We then compare the diameter of those deepest
    //branches with the current deepest diameter to determine if we have a new deepest. Particular attention has to be paid
    //to if a subtree only contains one initial node, as this is still a valid path and we shouldn't discard its subtree by
    //insisting on each subtree having at least two children i.e.
    //                  1
    //                  2
    //                3   4
    //              5   6
    //If we insisted on each subtree needing to have two children we would never get down to [3, 4, 5, 6] where the longest
    //diameter is to be found eventually we get back to the root where we stop.
    //
    //N.B. see https://stackoverflow.com/questions/2603692/what-is-the-difference-between-tree-depth-and-height/2603707#2603707
    //for difference between height and depth
    func diameter(_ root: NaryTreeNode?) -> Int {
        var longestDiameter = 0
        height(root, &longestDiameter)
        return longestDiameter
    }
    
    @discardableResult
    private func height(_ root: NaryTreeNode?, _ longestDiameter: inout Int) -> Int {
        guard let children = root?.children, !children.isEmpty else { //base when we go beyond a leaf
            return 0
        }
        
        var heights = [Int]()
        for child in children {
            let childHeight = height(child, &longestDiameter) + 1 //add this level
            heights.append(childHeight)
        }
        
        heights.sort { $0 > $1} //O(n log n)
        
        var diameterFromHere = 0
        if heights.count >= 2 {
            diameterFromHere = heights[0] + heights[1]
        } else {
            diameterFromHere = heights[0]
        }
        
        longestDiameter = max(diameterFromHere, longestDiameter)
        
        return heights[0]
    }
}
