//
//  BinarySearchTreeDepth.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 4.3
final class BinarySearchTreeDepth {
    
    var root: BinarySearchTreeDepthNode?
    
    // MARK: - Add
    
    func addValue(value: Int) {
        if root == nil {
            self.root = BinarySearchTreeDepthNode(value: value, depth: 0)
        } else {
            addValue(value: value, root: root!)
        }
    }
    
    private func addValue(value: Int, root: BinarySearchTreeDepthNode) {
        if value <= root.value {
            if root.left == nil {
                root.left = BinarySearchTreeDepthNode(value: value, depth: root.depth+1)
            } else {
                addValue(value: value, root: root.left!)
            }
        } else {
            if root.right == nil {
                root.right = BinarySearchTreeDepthNode(value: value, depth: root.depth+1)
            } else {
                addValue(value: value, root: root.right!)
            }
        }
    }
    
    // MARK: - Visit
    
    private func visited(node: BinarySearchTreeDepthNode, nodesVisited: inout [BinarySearchTreeDepthLinkedList]) {
        let depth = node.depth
        
        var list: BinarySearchTreeDepthLinkedList
        
        if depth > (nodesVisited.count - 1) {
            list = BinarySearchTreeDepthLinkedList()
            nodesVisited.append(list)
        } else {
            list = nodesVisited[node.depth]
        }
        
        list.addNode(binarySearchNode: node)
    }
    
    // MARK: - Depth
    
    func nodesInDepth() -> [BinarySearchTreeDepthLinkedList] {
        var nodesVisited = [BinarySearchTreeDepthLinkedList]()
        
        nodesInDepth(root: root, nodesVisited: &nodesVisited)
        
        return nodesVisited
    }
    
    private func nodesInDepth(root: BinarySearchTreeDepthNode?, nodesVisited: inout [BinarySearchTreeDepthLinkedList]) {
        guard let root = root else {
            return
        }
        
        visited(node: root, nodesVisited: &nodesVisited)
        
        nodesInDepth(root: root.left, nodesVisited: &nodesVisited)
        nodesInDepth(root: root.right, nodesVisited: &nodesVisited)
    }
}
