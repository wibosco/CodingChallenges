//
//  BinarySearchTree.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 31/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class BinarySearchTree: NSObject {

    // MARK: Properties
    
    var root: BinarySearchTreeNode?
    
    // MARK: Add
    
    func addValue(value: Int) {
        
        if root == nil {
            
            root = BinarySearchTreeNode.init(value: value)
        }
        else {
            
            addValue(value, root: root!)
        }
    }
    
    private func addValue(value: Int, root: BinarySearchTreeNode) {
        
        if value <= root.value  {
            
            if root.left == nil {
                
                root.left = BinarySearchTreeNode.init(value: value)
            }
            else {
                
                addValue(value, root: root.left!)
            }
        }
        else {
            
            if root.right == nil {
                
                root.right = BinarySearchTreeNode.init(value: value)
            }
            else {
                
                addValue(value, root: root.right!)
            }
        }
    }
    
    // MARK: Traversal
    
    private func addNodeToOrdering(node: BinarySearchTreeNode, inout ordering: String) {
    
        if ordering.characters.count > 0 {
            
            ordering += ", "
        }
        
        ordering += String(node.value)
    }
    
    func preOrderTraversal() -> String {
        
        if root != nil {
            
            var ordering = ""
            
            preOrderTraversal(root, ordering: &ordering)
            
            return ordering
        }
        
        return ""
    }
    
    private func preOrderTraversal(node: BinarySearchTreeNode?, inout ordering: String) {
        
        if node != nil {
            
            addNodeToOrdering(node!, ordering: &ordering)
            
            preOrderTraversal(node?.left, ordering: &ordering)
            preOrderTraversal(node?.right, ordering: &ordering)
        }
    }
    
    func inOrderTraversal() -> String {
        
        if root != nil {
            
            var ordering = ""
            
            inOrderTraversal(root, ordering: &ordering)
            
            return ordering
        }
        
        return ""
    }
    
    private func inOrderTraversal(node: BinarySearchTreeNode?, inout ordering: String) {
        
        if node != nil {
    
            inOrderTraversal(node?.left, ordering: &ordering)
            addNodeToOrdering(node!, ordering: &ordering)
            inOrderTraversal(node?.right, ordering: &ordering)
        }
    }
    
    func postOrderTraversal() -> String {
        
        if root != nil {
            
            var ordering = ""
            
            postOrderTraversal(root, ordering: &ordering)
            
            return ordering
        }
        
        return ""
    }
    
    private func postOrderTraversal(node: BinarySearchTreeNode?, inout ordering: String) {
        
        if node != nil {
            
            postOrderTraversal(node?.left, ordering: &ordering)
            postOrderTraversal(node?.right, ordering: &ordering)
            addNodeToOrdering(node!, ordering: &ordering)
        }
    }
    
    func levelTraversal() -> String {
        
        if root != nil {
            
            var ordering = ""
            
            let queue = LevelTraversalQueue()
            queue.enqueue(root!)
            
            while !queue.isEmpty() {
                
                let node = queue.dequeue()
                
                addNodeToOrdering(node, ordering: &ordering)
                
                if node.left != nil {
                    
                    queue.enqueue(node.left!)
                }
                
                if node.right != nil {
                    
                    queue.enqueue(node.right!)
                }
            }

            return ordering
        }
        
        return ""
    }
}
