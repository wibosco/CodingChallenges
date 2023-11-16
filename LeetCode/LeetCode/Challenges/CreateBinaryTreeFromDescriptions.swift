//
//  CreateBinaryTreeFromDescriptions.swift
//  LeetCode
//
//  Created by William Boles on 16/11/2023.
//

import Foundation

//https://leetcode.com/problems/create-binary-tree-from-descriptions/
struct CreateBinaryTreeFromDescriptions {
    
    //Time: O(n) where n is the number of elements in `descriptions`
    //Space: O(n)
    //binary tree
    //array
    //set
    //dictionary
    //
    //Solution Description:
    //Iterating through `descriptions` we convert each parent and child combination into `TreeNode` instances and store those nodes
    //in the `nodes` dictionary for future use. We associate the child with the parent as either left or right child. As this is a
    //tree we know that one node will not have a parent - the root, however we don't know in advance which node will be that root. So
    //as we iterate through `descriptions` we add the parent to the `parents` set if it isn't already known to be a child and add the
    //child to the `childern` set. Care must be taken to ensure that nodes that where parents-only but have now become childern of
    //another node are removed from the `parents` set. Once all elements in `descriptions` are being processed, only one element
    //should exist in `parents` which we can return as the root of the tree.
    static func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var childern = Set<Int>()
        var parents = Set<Int>()
        
        var nodes = [Int: TreeNode]()
        
        for description in descriptions {
            let parent = description[0]
            let child = description[1]
            let isLeft = description[2] == 1 ? true : false
            
            let parentNode = nodes[parent, default: TreeNode(parent)]
            let childNode = nodes[child, default: TreeNode(child)]
            
            if isLeft {
                parentNode.left = childNode
            } else {
                parentNode.right = childNode
            }
            
            nodes[parent] = parentNode
            nodes[child] = childNode
            
            if childern.contains(parent) { //parent is also a child elsewhere
                parents.remove(parent)
            } else {
                parents.insert(parent)
            }
            
            parents.remove(child) //child is also a parent elsewhere
            childern.insert(child)
        }
        
        return nodes[parents.first!]
    }
}
