//
//  BinarySearchTree.swift
//  CodingChallenges
//
//  Created by William Boles on 31/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class BinarySearchTreeNode {
    let value: Int
    var left: BinarySearchTreeNode?
    var right: BinarySearchTreeNode?
    
    // MARK: - Init
    
    init(value: Int) {
        self.value = value
    }
}

class BinarySearchTree {
    var root: BinarySearchTreeNode?
    
    // MARK: Add
    
    func addValue(value: Int) {
        if root == nil {
            root = BinarySearchTreeNode(value: value)
        } else {
            addValue(value: value, root: root!)
        }
    }
    
    private func addValue(value: Int, root: BinarySearchTreeNode) {
        if value <= root.value  {
            if root.left == nil {
                root.left = BinarySearchTreeNode(value: value)
            } else {
                addValue(value: value, root: root.left!)
            }
        } else {
            if root.right == nil {
                root.right = BinarySearchTreeNode(value: value)
            } else {
                addValue(value: value, root: root.right!)
            }
        }
    }
    
    // MARK: Traversal
    
    private func addNodeToOrdering(node: BinarySearchTreeNode, ordering: inout String) {
        if ordering.count > 0 {
            ordering += ", "
        }
        
        ordering += String(node.value)
    }
    
    func preOrderTraversal() -> String {
        guard let root = root else {
            return ""
        }
        
        var ordering = ""
        preOrderTraversal(node: root, ordering: &ordering)
        
        return ordering
    }
    
    private func preOrderTraversal(node: BinarySearchTreeNode?, ordering: inout String) {
        guard  let node = node else {
            return
        }
        
        addNodeToOrdering(node: node, ordering: &ordering)
        preOrderTraversal(node: node.left, ordering: &ordering)
        preOrderTraversal(node: node.right, ordering: &ordering)
    }
    
    func inOrderTraversal() -> String {
        guard let root = root else {
            return ""
        }
        
        var ordering = ""
        inOrderTraversal(node: root, ordering: &ordering)
        
        return ordering
    }
    
    private func inOrderTraversal(node: BinarySearchTreeNode?, ordering: inout String) {
        guard  let node = node else {
            return
        }
        
        inOrderTraversal(node: node.left, ordering: &ordering)
        addNodeToOrdering(node: node, ordering: &ordering)
        inOrderTraversal(node: node.right, ordering: &ordering)
    }
    
    func postOrderTraversal() -> String {
        guard let root = root else {
            return ""
        }
        
        var ordering = ""
        postOrderTraversal(node: root, ordering: &ordering)
        
        return ordering
    }
    
    private func postOrderTraversal(node: BinarySearchTreeNode?, ordering: inout String) {
        guard  let node = node else {
            return
        }
        
        postOrderTraversal(node: node.left, ordering: &ordering)
        postOrderTraversal(node: node.right, ordering: &ordering)
        addNodeToOrdering(node: node, ordering: &ordering)
    }
    
    func levelTraversal() -> String {
        guard let root = root else {
            return ""
        }
        
        var ordering = ""
        
        let queue = LevelTraversalQueue()
        queue.enqueue(node: root)
        
        while !queue.isEmpty() {
            let node = queue.dequeue()
            
            addNodeToOrdering(node: node, ordering: &ordering)
            
            if node.left != nil {
                queue.enqueue(node: node.left!)
            }
            
            if node.right != nil {
                queue.enqueue(node: node.right!)
            }
        }

        return ordering
    }
}

class LevelTraversalQueue {
    var nodes: [BinarySearchTreeNode] = [BinarySearchTreeNode]()
    
    // MARK: Enqueue
    
    func enqueue(node: BinarySearchTreeNode) {
        nodes.append(node)
    }
    
    func dequeue() -> BinarySearchTreeNode {
        return nodes.removeFirst()
    }
    
    // MARK: Empty
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
}
