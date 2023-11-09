//
//  TrimABinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 15/04/2022.
//

import Foundation

//https://leetcode.com/problems/trim-a-binary-search-tree/
struct TrimABinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the number of levels in the tree
    //binary search tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we recursively traverse the tree checking that each node is within the range low...high. If we encounter
    //a node that is too low then we (potentially) replace that node with its `right` node and then check that that right
    //node is within the range. We repeat this process but for `high` but this time we place the node with its `left`
    //node.
    
    //It's important to note that the guard statements also handle the case where the true tree root is outside of
    //low...high
    static func trimBST(_ root: BinaryTreeNode?, _ low: Int, _ high: Int) -> BinaryTreeNode? {
        guard let root = root else {
            return nil
        }
        
        guard root.val >= low else {
            //node is too low, its right node might be within range
            return trimBST(root.right, low, high)
        }
        
        guard root.val <= high else {
            //node is too high, its left node might be within range
            return trimBST(root.left, low, high)
        }
        
        root.left = trimBST(root.left, low, high)
        root.right = trimBST(root.right, low, high)
        
        return root
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the number of levels in the tree
    //binary search tree
    //DFS
    //recursive
    //
    //Solution Description:
    //First we need to make sure that our `root` is within the low...high range. If it isn't we traverse the tree until we
    //find that node (or nil out). With a valid `root` we then traverse the nodes of the tree, checking each nodes `left`
    //and `right` nodes are within the low...high range. If a node is lower than `low` we trim it from the tree and set its
    //higher `right` node in its place for us to then check if that node is within the range. If the current node has a
    //higher value than `low` then /we continue searching down its `left` branch so any that are lower. We repeat this
    //process for checking that nodes are within the upper bounds of the range.
    static func trimBSTTwoMethods(_ root: BinaryTreeNode?, _ low: Int, _ high: Int) -> BinaryTreeNode? {
        guard let root = root else {
            return nil
        }
        
        var newRoot: BinaryTreeNode? = root
       
        //find a root with a value that is within range
        while let nr = newRoot, nr.val < low || nr.val > high {
            if nr.val < low {
                newRoot = nr.right
            } else if nr.val > high {
                newRoot = nr.left
            }
        }
        
        trim(newRoot, low, high)
        
        return newRoot
    }
    
    private static func trim(_ node: BinaryTreeNode?, _ low: Int, _ high: Int) {
        guard let node = node else {
            return
        }
        
        if let left = node.left {
            if left.val < low {
                //left node too low replace with potentially higher left.right nodes
                node.left = left.right
                trim(node, low, high)
            } else {
                trim(left, low, high)
            }
        }
        
        if let right = node.right {
            if right.val > high {
                //right node too high replace with potentially lower right.left nodes
                node.right = right.left
                trim(node, low, high)
            } else {
                trim(right, low, high)
            }
        }
    }
}
