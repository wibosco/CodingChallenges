//
//  CountUnivalueSubtrees.swift
//  LeetCode
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/count-univalue-subtrees/
//binary tree
struct CountUnivalueSubtrees {
    //Time: O(n)
    //Space: O(h) where h is the height of the tree
    //DFS
    static func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        var count = 0
        isUnivalueTree(root, &count)
        
        return count
    }
    
    @discardableResult
    private static func isUnivalueTree(_ root: TreeNode?, _ count: inout Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.left == nil && root.right == nil { //all leafs are univalue trees
            count += 1
            return true
        }
        
        //can't be leaf node
        
        var isUnivalue = true
        
        if let left = root.left {
            isUnivalue = isUnivalueTree(left, &count) && root.val == left.val
        }
        
        if let right = root.right {
            //`isUnival` must come second otherwise the swift runtime will skip some recursive calls
            //i.e. one condition of the && being false mean there is no need to check the other conditions
            isUnivalue = isUnivalueTree(right, &count) && isUnivalue && root.val == right.val
        }
        
        if isUnivalue {
            count += 1 //only count this node once
        }
        
        return isUnivalue
    }
    
    // MARK: -
    
    //Time: O(n)
    //Space: O(h) where h is the height of the tree
    //DFS
    static func countUnivalSubtreesPushParentValueDown(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var count = 0
        isUnivalueTreePushParentValueDown(root, root.val, &count)
        
        return count
    }
    
    @discardableResult
    private static func isUnivalueTreePushParentValueDown(_ root: TreeNode?, _ parentVal: Int, _ count: inout Int) -> Bool {
        guard let root = root else {
            return true // no need to count here as the "upper" call will do the counting for leaf nodes
        }
        
        let isLeftTreeUnivalue = isUnivalueTreePushParentValueDown(root.left, root.val, &count)
        let isRightTreeUnivalue = isUnivalueTreePushParentValueDown(root.right, root.val, &count)
        
        if isLeftTreeUnivalue && isRightTreeUnivalue { //check if subtrees are univalue
            count += 1
            return root.val == parentVal //check if current tree is univalue
        }
        
        return false //can't be univalue if subtrees are not univalue trees
    }
    
    // MARK: -
    
    //Time: O(n)
    //Space: O(h) where h is the height of the tree
    //DFS
    static func countUnivalSubtreesPushChildValueUp(_ root: TreeNode?) -> Int {
        var count = 0
        countUnivalSubtreesPushChildValueUp(root, &count)
        
        return count
    }
    
    @discardableResult
    private static func countUnivalSubtreesPushChildValueUp(_ root: TreeNode?, _ count: inout Int) -> Int? {
        guard let root = root else {
            return nil
        }
        
        if root.left == nil && root.right == nil { //all leafs are univalue trees
            count += 1
            return root.val
        }
        
        //can't be leaf node
        
        //bubble the same value up (if it exists)
        let leftVal = countUnivalSubtreesPushChildValueUp(root.left, &count)
        let rightVal = countUnivalSubtreesPushChildValueUp(root.right, &count)
        
        //Make sure to only count once
        if root.left != nil && root.right != nil {
            if leftVal == root.val && rightVal == root.val {
                count += 1
                return root.val
            }
            
            return nil
        } else if root.left != nil {
            if leftVal == root.val {
                count += 1
                return root.val
            }
            
            return nil
        } else if root.right != nil {
            if rightVal == root.val {
                count += 1
                return root.val
            }
            
            return nil
        }
        
        return nil
    }
}
